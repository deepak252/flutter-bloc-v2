part of 'notes_cubit.dart';

class NotesState extends Equatable {
  final List<Note>? notes;
  final bool? isLoading;
  final String? error;

  const NotesState({this.notes, this.isLoading, this.error});

  NotesState copyWith({List<Note>? notes, bool? isLoading, String? error}) {
    return NotesState(
        notes: notes ?? this.notes,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [notes, isLoading];
}
