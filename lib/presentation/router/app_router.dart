import 'package:flutter/material.dart';
import 'package:flutter_bloc_v2/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_v2/presentation/screens/second_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/second':
        return MaterialPageRoute(builder: (_) => const SecondScreen());

      default:
        return null;
    }
  }
}
