import 'package:flutter/material.dart';

class NoteDialog extends StatelessWidget {
  NoteDialog({super.key});
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                        onPressed: () {},
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
    );
  }
}
