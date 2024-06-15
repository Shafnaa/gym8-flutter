import 'package:flutter/material.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';
import 'package:gym8/features/exercise/presentation/pages/detail_page.dart';

import 'difficulty_category.dart';
import 'type_category.dart';

class ExerciseItem extends StatelessWidget {
  final Exercise exercise;

  const ExerciseItem({
    required this.exercise,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 12,
      ),
      child: ElevatedButton(
        onPressed: () {
          DetailPage.route(context, exercise);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppPallete.darkGrayColor,
          ),
          foregroundColor: MaterialStateProperty.all(
            AppPallete.whiteColor,
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              foregroundImage: NetworkImage(
                exercise.muscle.imageUrl,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Muscle: ${exercise.muscle.name}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    DifficultyCategory(
                      id: exercise.difficulty.id,
                      name: exercise.difficulty.name,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    TypeCategory(
                      id: exercise.type.id,
                      name: exercise.type.name,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
