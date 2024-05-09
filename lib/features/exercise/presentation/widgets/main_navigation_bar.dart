import 'package:flutter/material.dart';
import 'package:gym8/core/common/widgets/destination.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Teal', Icons.home),
    Destination(1, 'Cyan', Icons.accessibility_new_outlined),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
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
    );
  }
}
