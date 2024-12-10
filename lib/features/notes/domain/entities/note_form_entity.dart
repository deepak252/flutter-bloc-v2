import 'package:equatable/equatable.dart';

class NoteFormEntity extends Equatable {
  final String? id;
  final String title;
  final String? content;

  const NoteFormEntity({this.id, required this.title, required this.content});

  @override
  List<Object?> get props => [id, title, content];
}
