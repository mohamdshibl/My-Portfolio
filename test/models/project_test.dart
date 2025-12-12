import 'package:flutter_test/flutter_test.dart';
import 'package:myportoportfolio/src/models/project.dart';

void main() {
  group('Project Model', () {
    test('fromJson creates a valid Project object', () {
      final json = {
        "id": "1",
        "title": "Test Project",
        "description": "Description",
        "techStack": ["Flutter", "Dart"],
        "features": ["Feature 1"],
        "repoUrl": "http://github.com",
        "liveUrl": "http://example.com",
        "assets": ["img.png"]
      };

      final project = Project.fromJson(json);

      expect(project.id, "1");
      expect(project.title, "Test Project");
      expect(project.techStack.length, 2);
      expect(project.techStack.first, "Flutter");
    });

    test('fromJson handles null optional fields', () {
      final json = {
        "id": "2",
        "title": "Project 2",
        "description": "Desc",
      };
      
      final project = Project.fromJson(json);
      expect(project.repoUrl, null);
      expect(project.techStack, isEmpty);
    });
  });
}
