import 'package:flutter/material.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/screens/notes_screen.dart';
import 'package:flutter_bloc_v2/home_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/notes':
        return MaterialPageRoute(builder: (_) => const NotesScreen());

      default:
        return null;
    }
  }
}
