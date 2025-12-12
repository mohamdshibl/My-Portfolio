import 'package:flutter/material.dart';
import '../../ui/sections/contact_section.dart';
import '../../ui/sections/hero_section.dart';
import '../../ui/sections/projects_section.dart';
import '../../ui/sections/skills_section.dart';
import '../widgets/app_shell.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      scrollController: _scrollController,
      onScrollToProjects: () => _scrollToSection(_projectsKey),
      onScrollToSkills: () => _scrollToSection(_skillsKey),
      onScrollToContact: () => _scrollToSection(_contactKey),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              onContactTap: () => _scrollToSection(_contactKey),
              onProjectsTap: () => _scrollToSection(_projectsKey),
            ),
            ProjectsSection(key: _projectsKey),
            SkillsSection(key: _skillsKey),
            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }
}

