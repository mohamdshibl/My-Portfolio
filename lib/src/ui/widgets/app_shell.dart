import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;
  final VoidCallback onScrollToProjects;
  final VoidCallback onScrollToSkills;
  final VoidCallback onScrollToContact;

  const AppShell({
    super.key,
    required this.child,
    required this.scrollController,
    required this.onScrollToProjects,
    required this.onScrollToSkills,
    required this.onScrollToContact,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mohamed Shibl",
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        actions: isDesktop 
          ? [
              TextButton(onPressed: onScrollToProjects, child: const Text("Projects")),
              TextButton(onPressed: onScrollToSkills, child: const Text("Skills")),
              TextButton(onPressed: onScrollToContact, child: const Text("Contact")),
              const SizedBox(width: 20),
            ]
          : null,
      ),
      drawer: !isDesktop
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    title: const Text('Projects'),
                    onTap: () {
                      Navigator.pop(context);
                      onScrollToProjects();
                    },
                  ),
                  ListTile(
                    title: const Text('Skills'),
                    onTap: () {
                      Navigator.pop(context);
                      onScrollToSkills();
                    },
                  ),
                  ListTile(
                    title: const Text('Contact'),
                    onTap: () {
                       Navigator.pop(context);
                       onScrollToContact();
                    },
                  ),
                ],
              ),
            )
          : null,
      body: child,
    );
  }
}
