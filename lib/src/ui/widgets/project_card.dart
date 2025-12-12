import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project.dart';
import '../../theme/app_theme.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  Future<void> _launchUrl(String? urlString) async {
    if (urlString == null) return;
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      // debugPrint('Could not launch \$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image Placeholder
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              image: project.assets.isNotEmpty
                  ? DecorationImage(
                      image: AssetImage(project.assets.first),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: project.assets.isEmpty
                ? const Center(
                    child: Icon(Icons.image, size: 50, color: Colors.grey))
                : null,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.secondaryTextColor,
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.techStack
                        .map((tech) => Chip(
                              label: Text(tech),
                              backgroundColor:
                                  AppTheme.primaryColor.withOpacity(0.1),
                              labelStyle: const TextStyle(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: project.features.map((feature) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("• ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Expanded(child: Text(feature)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      if (project.repoUrl != null)
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 40),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () => _launchUrl(project.repoUrl),
                          icon: const Icon(Icons.code),
                          label: const Text("GitHub"),
                        ),
                      const SizedBox(width: 16),
                      if (project.liveUrl != null)
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 40),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () => _launchUrl(project.liveUrl),
                          icon: const Icon(Icons.launch),
                          label: const Text("Live Demo"),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
