import 'package:flutter/material.dart';
import 'package:flutter_bloc_v2/core/routes/app_routes.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/cubits/note_form_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/cubits/note_list_cubit.dart';

final GetIt getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<NoteListCubit>()),
          BlocProvider(create: (context) => getIt<NoteFormCubit>())
        ],
        child: MaterialApp(
          title: 'Notes App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ));
  }
}
