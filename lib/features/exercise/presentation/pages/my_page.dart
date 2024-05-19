import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym8/features/schedule/presentation/widgets/my_calendar.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  AuthSignOut(),
                );
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              AppPallete.redColor,
            ),
          ),
          child: const Text(
            "Sign Out",
            style: TextStyle(
              color: AppPallete.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const MyCalendar(),
      ],
    );
  }
}
