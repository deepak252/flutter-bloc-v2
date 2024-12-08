part of 'notes_cubit.dart';

typedef NoteList = AsyncState<List<Note>>;
class NoteFormValues {
  final String title;
  final String? content;
  const NoteFormValues({required this.title, this.content});
}

class NotesState extends Equatable {
  final NoteList noteList;
  

  const NotesState({required this.noteList});

  NotesState copyWith({NoteList? noteList}) {
    return NotesState(noteList: noteList ?? this.noteList);
  }

  @override
  List<Object?> get props => [noteList];
}


// class NotesState extends Equatable {
//   final List<Note>? notes;
//   final bool? isLoading;
//   final String? error;

//   const NotesState({this.notes, this.isLoading, this.error});

//   NotesState copyWith({List<Note>? notes, bool? isLoading, String? error}) {
//     return NotesState(
//         notes: notes ?? this.notes,
//         isLoading: isLoading ?? this.isLoading,
//         error: error ?? this.error);
//   }

//   @override
//   List<Object?> get props => [notes, isLoading];
// }
