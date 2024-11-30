import 'package:flutter/material.dart';
import 'package:flutter_bloc_v2/presentation/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final _counterCubit = CounterCubit();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      // routes: {
      //   '/': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: const HomeScreen(),
      //       ),
      //   '/second': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: const SecondScreen(),
      //       )
      // },
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
    // _counterCubit.close();
    _appRouter.dispose();
    super.dispose();
  }
}
