import 'package:flutter_bloc_v2/features/notes/data/models/models.dart';
import 'package:flutter_bloc_v2/features/notes/domain/entities/entities.dart';

class NoteFormMapper {
  static NoteFormEntity toEntity(NoteFormModel model) {
    return NoteFormEntity(
      id: model.id,
      title: model.title,
      content: model.content,
    );
  }

  static NoteFormModel toModel(NoteFormEntity entity) {
    return NoteFormModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
    );
  }
}
