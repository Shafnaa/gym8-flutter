import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/core/utils/get_initials.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/exercise/presentation/bloc/exercise_bloc.dart';
import 'package:gym8/features/exercise/presentation/widgets/exercise_item.dart';
import 'package:gym8/features/exercise_schedule/domain/entities/exercise_schedule.dart';
import 'package:gym8/features/schedule/presentation/bloc/schedule_bloc.dart';

class MyExercises extends StatefulWidget {
  final List<ExerciseSchedule> exerciseSchedule;

  const MyExercises({
    super.key,
    required this.exerciseSchedule,
  });

  @override
  State<MyExercises> createState() => _MyExercisesState();
}

class _MyExercisesState extends State<MyExercises> {
  @override
  void initState() {
    super.initState();

    context.read<ScheduleBloc>().add(ScheduleFetchAllSchedules());
    context.read<ExerciseBloc>().add(ExerciseFetchAllExercises());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleBloc, ScheduleState>(
      listener: (context, state) {
        if (state is ScheduleFailure) {
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is ScheduleLoading) {
          return const Loader();
        }

        if (state is SchedulesDisplaySuccess) {
          final schedules = state.schedules;

          return BlocConsumer<ExerciseBloc, ExerciseState>(
            listener: (context, state) {
              if (state is ExerciseFailure) {
                showSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is ExerciseLoading) {
                return const Loader();
              }

              if (state is ExercisesDisplaySuccess) {
                final exercises = state.exercises;

                return Wrap(
                  direction: Axis.vertical,
                  spacing: 24,
                  children: schedules.map((e) {
                    return Wrap(
                      direction: Axis.vertical,
                      spacing: 8,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 4,
                          children: [
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                color: e.split.id == 1
                                    ? AppPallete.darkGrayColor
                                    : AppPallete.greenColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  getInitials(e.day.name).toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              e.day.name.substring(1),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                        e.split.id == 1
                            ? const Text(
                                "Enjoy your rest day mate!",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Wrap(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: widget.exerciseSchedule
                                    .filter(
                                  (t) => t.scheduleId == e.id,
                                )
                                    .map(
                                  (element) {
                                    return ExerciseItem(
                                      exercise: exercises.firstWhere(
                                        (e) => e.id == element.exerciseId,
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                      ],
                    );
                  }).toList(),
                );
              }

              return const Text("data");
            },
          );
        }

        return const Text("something wrong");
      },
    );
  }
}
