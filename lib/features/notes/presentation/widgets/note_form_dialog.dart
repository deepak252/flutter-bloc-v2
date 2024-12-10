import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v2/features/notes/presentation/cubits/note_form_cubit.dart';

class NoteFormDialog extends StatelessWidget {
  NoteFormDialog({super.key});
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormCubit, NoteFormState>(
      listener: (_, state) {
        print('Notedialog, ${state.isSuccess}');
        if (state.isSuccess) {
          Navigator.pop(context);
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Dialog(
          insetPadding: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          "Add Note",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _titleController,
                      onChanged: context.read<NoteFormCubit>().updateTitle,
                      decoration: const InputDecoration(
                          hintText: "Enter title*",
                          labelText: "Title",
                          alignLabelWithHint: true
                          // border: OutlineInputBorder()
                          ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Title can't be empty!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _contentController,
                      onChanged: context.read<NoteFormCubit>().updateContent,
                      decoration: const InputDecoration(
                        hintText: "Enter Description",
                        labelText: "Description",
                        alignLabelWithHint: true,
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        const SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<NoteFormCubit>().submitNote();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white),
                          child: const Text("Save"),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
