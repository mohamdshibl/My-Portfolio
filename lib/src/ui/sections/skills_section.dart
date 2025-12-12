import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    final skills = [
      {"name": "Flutter & Dart", "level": 0.95},
      {"name": "State Management (Riverpod, Bloc)", "level": 0.90},
      {"name": "Firebase & Cloud Functions", "level": 0.85},
      {"name": "REST APIs & GraphQL", "level": 0.85},
      {"name": "Git & CI/CD", "level": 0.80},
      {"name": "UI/UX Implementation", "level": 0.90},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 20,
        vertical: 80,
      ),
      color: Theme.of(context).colorScheme.surface,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Skills & Expertise",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 50),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: skills.map((skill) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            skill["name"] as String,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          Text(
                            "${((skill["level"] as double) * 100).toInt()}%",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: skill["level"] as double,
                          minHeight: 10,
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppTheme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
