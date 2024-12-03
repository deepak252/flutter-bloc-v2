import 'package:flutter_bloc_v2/core/resources/params.dart';
import 'package:flutter_bloc_v2/core/resources/result.dart';
import 'package:flutter_bloc_v2/core/usecase/usecase.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/note.dart';
import 'package:flutter_bloc_v2/features/notes/domain/repositories/notes_repository.dart';

class GetNotes extends UseCase<Result<List<Note>>, NoParams> {
  final NotesRepository _notesRepository;

  GetNotes(this._notesRepository);

  @override
  Future<Result<List<Note>>> call(NoParams params) async {
    return await _notesRepository.getNotes();
  }
}
