part of 'notes_cubit.dart';

abstract class NotesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotesInitialState extends NotesState {}

class GetNotesLoading extends NotesState {}

class GetNotesSuccess extends NotesState {
  final List<Note> notes;
  GetNotesSuccess({required this.notes});

  @override
  List<Object?> get props => [notes];
}

class GetNotesError extends NotesState {
  final String? message;
  GetNotesError({this.message});

  @override
  List<Object?> get props => [message];
}

// class NotesState extends Equatable {
//   final List<Note>? notes;
//   final bool? isLoading;

//   const NotesState({this.notes, this.isLoading});

//   @override
//   List<Object?> get props => [notes, isLoading];

//   NotesState copyWith({
//     List<Note>? notes,
//     bool? isLoading,
//   }) {
//     return NotesState(
//       notes: notes ?? this.notes,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }
