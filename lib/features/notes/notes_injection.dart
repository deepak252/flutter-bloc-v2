import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_v2/features/notes/data/datasources/notes_remote_data_source.dart';
import 'package:flutter_bloc_v2/features/notes/data/repositories/notes_repository_impl.dart';
import 'package:flutter_bloc_v2/features/notes/domain/repositories/notes_repository.dart';
import 'package:flutter_bloc_v2/features/notes/domain/usecases/usecases.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/cubit/notes_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupNotesInjection() {
  // Logic
  // UseCase
  // Repositories
  // Datasources
  // External Dependencies
  getIt
    ..registerFactory<NotesCubit>(() => NotesCubit(getNotes: getIt<GetNotes>()))
    ..registerLazySingleton<GetNotes>(() => GetNotes(getIt<NotesRepository>()))
    ..registerLazySingleton<NotesRepository>(() => NotesRepositoryImpl(
        notesRemoteDataSource: getIt<NotesRemoteDataSource>()))
    ..registerLazySingleton<NotesRemoteDataSource>(
        () => NotesRemoteDataSourceImpl(getIt<http.Client>()));
}
