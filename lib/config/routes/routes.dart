import 'package:flutter/material.dart';
import 'package:gym8/features/auth/presentation/pages/sign_in_page.dart';
import 'package:gym8/features/auth/presentation/pages/sign_up_page.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';
import 'package:gym8/features/exercise/presentation/pages/detail_page.dart';
import '../../features/exercise/presentation/widgets/main_wrapper.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const MainWrapper());

      case '/Details':
        return _materialRoute(
            DetailPage(exercise: settings.arguments as Exercise));

      case '/SignIn':
        return _materialRoute(const SignInPage());

      case '/SignUp':
        return _materialRoute(const SignUpPage());

      default:
        return _materialRoute(const MainWrapper());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
