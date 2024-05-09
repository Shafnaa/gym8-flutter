import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/exercise/presentation/bloc/exercise_bloc.dart';
import 'package:gym8/features/exercise/presentation/widgets/exercise_item.dart';

class ExercisesList extends StatefulWidget {
  final int? limit;
  const ExercisesList({
    this.limit,
    super.key,
  });

  @override
  State<ExercisesList> createState() => _ExercisesListState();
}

class _ExercisesListState extends State<ExercisesList> {
  @override
  void initState() {
    super.initState();
    context.read<ExerciseBloc>().add(ExerciseFetchAllExercises());
  }

  @override
  Widget build(BuildContext context) {
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
          return ListView.builder(
            itemCount: widget.limit ?? state.exercises.length,
            itemBuilder: (context, index) {
              final exercise = state.exercises[index];

              return ExerciseItem(
                exercise: exercise,
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
