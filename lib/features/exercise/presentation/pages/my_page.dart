import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/exercise_schedule/presentation/bloc/exercise_schedule_bloc.dart';
import 'package:gym8/features/history/presentation/bloc/history_bloc.dart';
import 'package:gym8/features/history/presentation/widgets/my_calendar.dart';
import 'package:gym8/features/exercise_schedule/presentation/widgets/my_exercises.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();

    context
        .read<ExerciseScheduleBloc>()
        .add(ExerciseScheduleFetchAllExerciseSchedules());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MyCalendar(),
          const SizedBox(
            height: 24,
          ),
          BlocConsumer<HistoryBloc, HistoryState>(
            listener: (context, state) {
              if (state is HistoryFailure) {
                showSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context.read<HistoryBloc>().add(HistoryRecordHistory());
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppPallete.greenColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  "Record History",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 24,
          ),
          BlocConsumer<ExerciseScheduleBloc, ExerciseScheduleState>(
            listener: (context, state) {
              if (state is ExerciseScheduleFailure) {
                showSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is ExerciseScheduleLoading) {
                return const Loader();
              }

              if (state is ExerciseSchedulesDisplaySuccess) {
                return MyExercises(
                  exerciseSchedule: state.exerciseSchedules,
                );
              }

              return const Text("ada yang salah lur");
            },
          ),
        ],
      ),
    );
  }
}
