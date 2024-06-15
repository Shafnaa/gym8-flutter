import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/core/utils/get_initials.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/exercise_schedule/presentation/bloc/exercise_schedule_bloc.dart';
import 'package:gym8/features/schedule/domain/entities/schedule.dart';

class ScheduleButton extends StatefulWidget {
  final int exerciseId;
  final Schedule schedule;

  const ScheduleButton({
    super.key,
    required this.exerciseId,
    required this.schedule,
  });

  @override
  State<ScheduleButton> createState() => _ScheduleButtonState();
}

class _ScheduleButtonState extends State<ScheduleButton> {
  @override
  void initState() {
    super.initState();

    context
        .read<ExerciseScheduleBloc>()
        .add(ExerciseScheduleFetchAllExerciseSchedules());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExerciseScheduleBloc, ExerciseScheduleState>(
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
          return SizedBox(
            width: 54,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                context.read<ExerciseScheduleBloc>().add(
                      ExerciseScheduleTriggerExerciseSchedule(
                        exerciseId: widget.exerciseId,
                        scheduleId: widget.schedule.id,
                      ),
                    );
              },
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.zero,
                ),
                backgroundColor: state.exerciseSchedules.any((element) =>
                        element.exerciseId == widget.exerciseId &&
                        element.scheduleId == widget.schedule.id)
                    ? const MaterialStatePropertyAll(AppPallete.greenColor)
                    : const MaterialStatePropertyAll(AppPallete.redColor),
                foregroundColor: const MaterialStatePropertyAll(
                  AppPallete.whiteColor,
                ),
                shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              child: Text(
                getInitials(widget.schedule.day.name).toUpperCase(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }

        if (state is ExerciseScheduleTriggerSuccess) {
          return SizedBox(
            width: 54,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                context.read<ExerciseScheduleBloc>().add(
                      ExerciseScheduleTriggerExerciseSchedule(
                        exerciseId: widget.exerciseId,
                        scheduleId: widget.schedule.id,
                      ),
                    );
              },
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.zero,
                ),
                backgroundColor: state.exerciseSchedules.any((element) =>
                        element.exerciseId == widget.exerciseId &&
                        element.scheduleId == widget.schedule.id)
                    ? const MaterialStatePropertyAll(AppPallete.greenColor)
                    : const MaterialStatePropertyAll(AppPallete.redColor),
                foregroundColor: const MaterialStatePropertyAll(
                  AppPallete.whiteColor,
                ),
                shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              child: Text(
                getInitials(widget.schedule.day.name).toUpperCase(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }

        return const Text("Ada yang salah nihh");
      },
    );
  }
}
