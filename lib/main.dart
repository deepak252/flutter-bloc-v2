import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_v2/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_v2/presentation/screens/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(),
            )
      },
      // home: BlocProvider<CounterCubit>(
      //     create: (_) => CounterCubit(), child: const HomeScreen()),
    );
    // return BlocProvider<CounterCubit>(
    //   create: (_) => CounterCubit(),
    //   child: MaterialApp(
    //     title: 'Flutter Bloc',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const HomeScreen(),
    //   ),
    // );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
