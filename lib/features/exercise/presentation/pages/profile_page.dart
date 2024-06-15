import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';

class ProfilePage extends StatelessWidget {
  static route(
    BuildContext context,
  ) =>
      Navigator.pushNamed(
        context,
        '/Profile',
      );

  const ProfilePage({super.key});

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
          ],
        ),
      ),
    );
  }
}
