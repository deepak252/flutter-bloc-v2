part of 'note_list_cubit.dart';

class NoteListState extends Equatable {
  final List<Note>? notes;
  final bool? isLoading;
  final String? errorMessage;

  const NoteListState({this.notes, this.isLoading, this.errorMessage});

  NoteListState copyWith(
      {List<Note>? notes, bool? isLoading, String? errorMessage}) {
    return NoteListState(
        notes: notes ?? this.notes,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [notes, isLoading];
}
