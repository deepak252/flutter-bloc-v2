import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_v2/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(), child: const HomeScreen()),
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
}
