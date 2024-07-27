import 'package:docdoc/Features/onBoarding/ui/onbboarding_screen.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnbboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const Placeholder());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
