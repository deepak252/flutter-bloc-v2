import 'package:flutter_bloc_v2/features/notes/domain/entities/note_form_entity.dart';

class NoteFormModel extends NoteFormEntity {
  const NoteFormModel({
    super.id,
    required super.title,
    super.content,
  });

  factory NoteFormModel.fromJson(Map<String, dynamic> json) => NoteFormModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',
      'title': title,
      'content': content,
    };
  }

  NoteFormModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return NoteFormModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
