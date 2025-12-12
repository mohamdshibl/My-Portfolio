import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportoportfolio/src/models/project.dart';
import 'package:myportoportfolio/src/ui/widgets/project_card.dart';

void main() {
  testWidgets('ProjectCard displays project details', (WidgetTester tester) async {
    final project = Project(
      id: "1",
      title: "Test Project",
      description: "Test Description",
      techStack: ["Flutter"],
      features: ["Feature"],
      assets: [],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProjectCard(project: project),
        ),
      ),
    );

    expect(find.text('Test Project'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
    expect(find.text('Flutter'), findsOneWidget);
  });
}
