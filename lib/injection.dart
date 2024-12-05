import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_v2/features/notes/notes_injection.dart';

final GetIt getIt = GetIt.instance;

void setupInjection() {
  getIt.registerLazySingleton(http.Client.new);
  setupNotesInjection();
}
