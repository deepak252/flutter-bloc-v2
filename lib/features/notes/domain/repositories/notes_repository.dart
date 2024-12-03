import 'package:flutter_bloc_v2/core/resources/result.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/note.dart';

abstract class NotesRepository {
  Future<Result<List<Note>>> getNotes();
  Future<Result<Note>> getNote(String id);
  Future<Result<Note>> createNote(Note note);
  Future<Result<Note>> updateNote(Note note);
  Future<Result<Note>> deleteNote(String noteId);
}
