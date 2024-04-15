import 'package:flutter/material.dart';
import 'package:gym8/core/common/widgets/destination.dart';
import 'package:gym8/features/exercise/presentation/pages/home_page.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({
    super.key,
    required this.destination,
    required this.navigatorKey,
  });

  final Destination destination;
  final Key navigatorKey;

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return HomePage();
              case '/list':
                return HomePage();
            }
            assert(false);
            return const SizedBox();
          },
        );
      },
    );
  }
}
