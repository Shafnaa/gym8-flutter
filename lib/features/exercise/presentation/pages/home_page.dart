import 'package:flutter/material.dart';
import 'package:gym8/features/exercise/presentation/widgets/exercise_list.dart';

class HomePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: ExercisesList(
            limit: 100,
          ),
        ),
      ],
    );
  }
}
