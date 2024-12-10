import 'package:flutter_bloc_v2/features/notes/domain/entities/entities.dart';

List<NoteModel> notesFromJson(List<Map<String, dynamic>> notesJson) {
  return notesJson
      .map<NoteModel>((noteJson) => NoteModel.fromJson(noteJson))
      .where(
          (NoteModel note) => note.id.isNotEmpty) //Filter Invalid Note Format
      .toList();
}

// List<Map<String, dynamic>> notesToJson(List<NoteModel> notes) {
//   return notes
//       .map<Map<String, dynamic>>((note) => note.toJson())
//       .toList();
// }

class NoteModel extends Note {
  const NoteModel({
    required super.id,
    required super.title,
    required super.content,
    required super.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.fromMillisecondsSinceEpoch(
            (json["createdAt"] as int) * 1000),
      );

  NoteModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
