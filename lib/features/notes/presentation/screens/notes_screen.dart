import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/cubit/notes_cubit.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    context.read<NotesCubit>().getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Builder(builder: (context) {
        // contxt.select((CounterCubit cubit) => cubit.state.wasIncremented);
        final notes = context.watch<NotesCubit>().state;
        if (notes is GetNotesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (notes is GetNotesSuccess) {
          final notesList = notes.notes;
          return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(
                    notesList[index].title,
                  ),
                  subtitle: Text(notesList[index].content ?? ''),
                );
              });
        }
        return const Center(
          child: Text('Something went wrong!'),
        );
      }),
    );
  }
}
