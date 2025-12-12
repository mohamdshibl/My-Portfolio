class Project {
  final String id;
  final String title;
  final String description;
  final List<String> techStack;
  final List<String> features;
  final String? repoUrl;
  final String? liveUrl;
  final List<String> assets;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.techStack,
    required this.features,
    this.repoUrl,
    this.liveUrl,
    required this.assets,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      techStack: List<String>.from(json['techStack'] ?? []),
      features: List<String>.from(json['features'] ?? []),
      repoUrl: json['repoUrl'] as String?,
      liveUrl: json['liveUrl'] as String?,
      assets: List<String>.from(json['assets'] ?? []),
    );
  }
}
