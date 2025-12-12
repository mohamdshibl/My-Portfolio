import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportoportfolio/src/ui/sections/contact_section.dart';

void main() {
  testWidgets('ContactSection displays email button', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ContactSection(),
        ),
      ),
    );

    expect(find.text('Get In Touch'), findsOneWidget);
    expect(find.text('Say Hello'), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);
  });
}
