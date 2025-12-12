import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/project.dart';

class DataService {
  Future<List<Project>> loadProjects() async {
    try {
      final String response = await rootBundle.loadString('assets/data/projects.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Project.fromJson(json)).toList();
    } catch (e) {
      // In a real app, we might log this error to a service like Sentry
      throw Exception('Failed to load projects: $e');
    }
  }
}
