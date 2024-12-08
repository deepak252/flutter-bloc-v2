import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/widgets/note_dialog.dart';

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
        // final notes = context.watch<NotesCubit>().state;
        final noteList = context.select((NotesCubit cubit) => cubit.state.noteList);
        final notes = noteList.value;
        if (notes != null) {
          return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(
                    notes[index].title,
                  ),
                  subtitle: Text(notes[index].content ?? ''),
                );
              });
        }
        if (noteList.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: Text('No Records Found!'),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => NoteDialog());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
