import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/widgets/destination.dart';
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym8/features/auth/presentation/pages/sign_in_page.dart';
import 'package:gym8/features/exercise/presentation/pages/home_page.dart';
import 'package:gym8/features/exercise/presentation/pages/my_page.dart';

class MainWrapper extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const MainWrapper(),
      );

  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Home', Icons.home),
    Destination(1, 'My', Icons.account_circle_rounded),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is! AuthSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            SignInPage.route(),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Loader();
        }

        return Scaffold(
          appBar: AppBar(
              // title: const Text("Gym 8"),
              ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            destinations: allDestinations
                .map<NavigationDestination>(
                  (Destination destination) => NavigationDestination(
                    icon: Icon(
                      destination.icon,
                    ),
                    label: destination.title,
                  ),
                )
                .toList(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: <Widget>[
              const HomePage(),
              const MyPage(),
            ][selectedIndex],
          ),
        );
      },
    );
  }
}
