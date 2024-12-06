import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/note.dart';
import 'package:flutter_bloc_v2/features/notes/domain/usecases/usecases.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final GetNotes _getNotes;

  NotesCubit({required GetNotes getNotes})
      : _getNotes = getNotes,
        super(const NotesState());

  Future getNotes() async {
    emit(state.copyWith(isLoading: true));
    final notesResult = await _getNotes();
    if (notesResult.failure != null) {
      emit(state.copyWith(error: notesResult.failure?.message));
    } else {
      emit(state.copyWith(notes: notesResult.data ?? []));
    }
    emit(state.copyWith(isLoading: false));
  }
}
