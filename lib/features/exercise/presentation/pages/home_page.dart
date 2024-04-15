import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("You're Signed in."),
        ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  AuthSignOut(),
                );
          },
          child: Text("Sign Out"),
        ),
      ],
    );
  }
}
