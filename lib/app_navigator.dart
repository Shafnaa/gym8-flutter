import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/widgets/destination.dart';
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym8/features/auth/presentation/pages/sign_in_page.dart';
import 'package:gym8/features/exercise/presentation/pages/home_page.dart';

class AppNavigator extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AppNavigator(),
      );

  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Teal', Icons.home, Colors.cyan),
    Destination(1, 'Cyan', Icons.accessibility_new_outlined, Colors.cyan),
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
                            color: destination.color,
                          ),
                          label: destination.title,
                        ))
                .toList(),
          ),
          body: <Widget>[
            const HomePage(),
            const HomePage(),
          ][selectedIndex],
        );
      },
    );
  }
}
