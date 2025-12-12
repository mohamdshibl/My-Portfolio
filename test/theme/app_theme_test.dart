import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportoportfolio/src/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('Primary color is correct', () {
      expect(AppTheme.primaryColor, const Color(0xFF246BFD));
    });

  });
}
