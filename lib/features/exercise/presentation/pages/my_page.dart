import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("You're Signed in."),
        ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  AuthSignOut(),
                );
          },
          child: const Text("Sign Out"),
        ),
      ],
    );
  }
}
