import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/project.dart';
import '../services/data_service.dart';

final dataServiceProvider = Provider<DataService>((ref) {
  return DataService();
});

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final dataService = ref.watch(dataServiceProvider);
  return dataService.loadProjects();
});
