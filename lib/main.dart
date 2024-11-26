import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/cubit/counter_cubit.dart';
import 'package:flutter_bloc_v2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider is a Flutter widget which provides a bloc to its children via BlocProvider.of<T>(context).
    // https://pub.dev/packages/flutter_bloc#blocprovider
    return BlocProvider(
      // lazy: false,
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
