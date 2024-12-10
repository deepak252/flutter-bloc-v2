import 'package:flutter_bloc_v2/core/resources/result.dart';
import 'package:flutter_bloc_v2/core/usecase/usecase_with_params.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/entities.dart';
import 'package:flutter_bloc_v2/features/notes/domain/repositories/notes_repository.dart';

class CreateNote extends UseCaseWithParams<Result<Note>, CreateNotePrams> {
  final NotesRepository _notesRepository;
  CreateNote(this._notesRepository);

  @override
  Future<Result<Note>> call(CreateNotePrams params) async {
    return await _notesRepository.createNote(params.noteForm);
  }
}

class CreateNotePrams {
  final NoteFormEntity noteForm;

  const CreateNotePrams({required this.noteForm});
}
