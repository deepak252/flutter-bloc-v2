import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/note.dart';
import 'package:flutter_bloc_v2/features/notes/domain/usecases/usecases.dart';

part 'note_list_state.dart';

class NoteListCubit extends Cubit<NoteListState> {
  final GetNotes _getNotes;

  NoteListCubit({required GetNotes getNotes})
      : _getNotes = getNotes,
        super(const NoteListState());

  Future getNotes() async {
    emit(state.copyWith(isLoading: true));
    final notesResult = await _getNotes();
    if (notesResult.failure != null) {
      emit(state.copyWith(errorMessage: notesResult.failure?.message));
    } else {
      emit(state.copyWith(notes: notesResult.data));
    }
    emit(state.copyWith(isLoading: false));
  }
}
