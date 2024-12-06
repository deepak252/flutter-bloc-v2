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
        // final notes = context.watch<NotesCubit>().state;
        final notes = context.select((NotesCubit cubit)=>cubit.state);
        final notesList = notes.notes;
        if (notesList != null) {
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
        if (notes.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: Text('No Records Found!'),
        );
      }),
    );
  }
}
