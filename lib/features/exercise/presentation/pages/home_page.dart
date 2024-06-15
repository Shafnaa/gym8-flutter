import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/exercise/presentation/widgets/exercise_list.dart';
import 'package:gym8/features/history/presentation/bloc/history_bloc.dart';

class HomePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppPallete.purpleColor,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Image(
                    height: 32,
                    image: AssetImage('assets/my_icon.png'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Gym8",
                    style: TextStyle(
                      color: AppPallete.purpleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Good morning Saujana!",
                style: TextStyle(
                  color: AppPallete.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Don't forget to hit the gym mate! I'll be waiting at the squat rack!!!",
                style: TextStyle(
                  color: AppPallete.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12,
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
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          "Explore exercise menu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Expanded(
          child: ExercisesList(
            limit: 100,
          ),
        ),
      ],
    );
  }
}
