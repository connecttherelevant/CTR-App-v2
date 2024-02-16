import 'package:flutter/material.dart';
import 'package:musicidia/core/navigation/routes_name.dart';
import 'package:musicidia/modules/app_welcome/app_welcome.dart';
import 'package:musicidia/modules/auth/auth.dart';
import 'package:musicidia/modules/splash/splash.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const AppWelcomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      default:
        throw const FormatException("Route not found");
    }
  }
}
