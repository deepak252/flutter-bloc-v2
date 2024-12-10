import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/entities.dart';
import 'package:flutter_bloc_v2/features/notes/domain/usecases/usecases.dart';

part 'note_form_state.dart';

class NoteFormCubit extends Cubit<NoteFormState> {
  final CreateNote _createNote;

  NoteFormCubit({required CreateNote createNote})
      : _createNote = createNote,
        super(const NoteFormState());

  void updateTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void updateContent(String content) {
    emit(state.copyWith(content: content));
  }

  void resetForm() {
    emit(const NoteFormState());
  }

  Future submitNote() async {
    emit(state.copyWith(isSubmitting: true));
    final result = await _createNote(CreateNotePrams(
        noteForm: NoteFormEntity(title: state.title, content: state.content)));
    if (result.failure != null) {
      emit(state.copyWith(errorMessage: result.failure?.message));
    } else {
      emit(const NoteFormState(isSuccess: true));
    }
    emit(state.copyWith(isSubmitting: false));
  }
}
