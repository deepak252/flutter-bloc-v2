import 'package:flutter_bloc_v2/core/resources/result.dart';
import 'package:flutter_bloc_v2/core/usecase/usecase_without_params.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/note.dart';
import 'package:flutter_bloc_v2/features/notes/domain/repositories/notes_repository.dart';

class GetNotes extends UseCaseWithoutParams<Result<List<Note>>> {
  final NotesRepository _notesRepository;

  GetNotes(this._notesRepository);

  @override
  Future<Result<List<Note>>> call() async {
    return await _notesRepository.getNotes();
  }
}
