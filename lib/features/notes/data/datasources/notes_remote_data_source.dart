import 'dart:convert';
import 'package:flutter_bloc_v2/core/constants/api_constants.dart';
import 'package:flutter_bloc_v2/core/resources/exceptions.dart';
import 'package:flutter_bloc_v2/features/notes/data/models/models.dart';
import 'package:http/http.dart' as http;

abstract class NotesRemoteDataSource {
  Future<List<NoteModel>> getNotes();
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  final http.Client httpClient;

  NotesRemoteDataSourceImpl(this.httpClient);

  @override
  Future<List<NoteModel>> getNotes() async {
    final response = await http.get(Uri.parse(ApiConstants.notesUrl));
    if (response.statusCode == 200) {
      final notesJson = json.decode(response.body);
      return notesFromJson(List<Map<String, dynamic>>.from(notesJson));
    } else {
      throw ServerException(message: "Server Error");
    }
  }
}
