import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_v2/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_v2/presentation/screens/second_screen.dart';

class AppRouter {
  final _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(),
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(),
                ));

      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
