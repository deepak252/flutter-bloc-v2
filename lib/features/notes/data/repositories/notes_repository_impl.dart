import 'package:flutter_bloc_v2/core/resources/exceptions.dart';
import 'package:flutter_bloc_v2/core/resources/failure.dart';
import 'package:flutter_bloc_v2/core/resources/result.dart';
import 'package:flutter_bloc_v2/features/notes/data/datasources/notes_remote_data_source.dart';
import 'package:flutter_bloc_v2/features/notes/data/mappers/note_form_mapper.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/entities.dart';
import 'package:flutter_bloc_v2/features/notes/domain/repositories/notes_repository.dart';

class NotesRepositoryImpl extends NotesRepository {
  final NotesRemoteDataSource _notesRemoteDataSource;

  NotesRepositoryImpl({required NotesRemoteDataSource notesRemoteDataSource})
      : _notesRemoteDataSource = notesRemoteDataSource;

  @override
  Future<Result<List<Note>>> getNotes() async {
    try {
      final notes = await _notesRemoteDataSource.getNotes();
      return ResultSuccess(data: notes);
    } catch (e) {
      final failure = ServerFailure(
          message:
              e is ServerException ? '${e.message}' : 'Something went wrong!');
      return ResultFailure(failure: failure);
    }
  }

  @override
  Future<Result<Note>> getNote(String id) {
    // TODO: implement getNote
    throw UnimplementedError();
  }

  @override
  Future<Result<Note>> createNote(NoteFormEntity noteForm) async {
    try {
      final note = await _notesRemoteDataSource
          .createNote(NoteFormMapper.toModel(noteForm));
      return ResultSuccess(data: note);
    } catch (e) {
      final failure = ServerFailure(
          message:
              e is ServerException ? '${e.message}' : 'Something went wrong!');
      return ResultFailure(failure: failure);
    }
  }

  @override
  Future<Result<Note>> updateNote(NoteFormEntity note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }

  @override
  Future<Result<Note>> deleteNote(String noteId) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }
}
