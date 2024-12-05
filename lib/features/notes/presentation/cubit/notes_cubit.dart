import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/note.dart';
import 'package:flutter_bloc_v2/features/notes/domain/usecases/usecases.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final GetNotes _getNotes;

  NotesCubit({required GetNotes getNotes})
      : _getNotes = getNotes,
        super(NotesInitialState());

  Future getNotes() async {
    emit(GetNotesLoading());
    final notesResult = await _getNotes();
    if (notesResult.failure != null) {
      emit(GetNotesError(message: notesResult.failure?.message));
    } else {
      emit(GetNotesSuccess(notes: notesResult.data ?? []));
    }
  }
}
