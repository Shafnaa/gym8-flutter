import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';
import 'package:gym8/features/exercise/presentation/widgets/difficulty_category.dart';
import 'package:gym8/features/exercise_schedule/presentation/widgets/schedule_button.dart';
import 'package:gym8/features/exercise/presentation/widgets/type_category.dart';
import 'package:gym8/features/schedule/presentation/bloc/schedule_bloc.dart';

class DetailPage extends StatefulWidget {
  static route(
    BuildContext context,
    Exercise exercise,
  ) =>
      Navigator.pushNamed(
        context,
        '/Details',
        arguments: exercise,
      );

  final Exercise exercise;

  const DetailPage({
    super.key,
    required this.exercise,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();

    context.read<ScheduleBloc>().add(ScheduleFetchAllSchedules());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.exercise.name,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Muscle:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.exercise.muscle.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Type:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    DifficultyCategory(
                      id: widget.exercise.difficulty.id,
                      name: widget.exercise.difficulty.name,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Difficulty:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    TypeCategory(
                      id: widget.exercise.type.id,
                      name: widget.exercise.type.name,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Equipment:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      widget.exercise.equipment.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Detailed Instruction",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.exercise.instruction,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add to your menu",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                BlocConsumer<ScheduleBloc, ScheduleState>(
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
                      final List<Widget> scheduleButtons = state.schedules
                          .filter((t) => t.split.id != 1)
                          .map((schedule) => ScheduleButton(
                                exerciseId: widget.exercise.id,
                                schedule: schedule,
                              ))
                          .toList();

                      return Wrap(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 12,
                        children: scheduleButtons,
                      );
                    }

                    return const Text("Hmm kenapa gagal yak!?");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
