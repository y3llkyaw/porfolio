import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String? id;
  final String title;
  final String url;
  final String githubUrl;
  final List<String> tags;
  final String description;
  final Timestamp? createdAt;

  Project({
    this.id,
    required this.title,
    required this.url,
    required this.githubUrl,
    required this.tags,
    required this.description,
    this.createdAt,
  });

  factory Project.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Project(
      id: doc.id,
      title: data['title'] ?? '',
      url: data['url'] ?? '',
      githubUrl: data['githubUrl'] ?? '',
      tags: List<String>.from(data['tags'] ?? []),
      description: data['description'] ?? '',
      createdAt: data['createdAt'] as Timestamp?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'url': url,
      'githubUrl': githubUrl,
      'tags': tags,
      'description': description,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}
