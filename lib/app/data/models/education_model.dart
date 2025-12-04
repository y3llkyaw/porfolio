import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String? id;
  String school;
  String degree;
  String? fieldOfStudy;
  String period;
  bool finished;
  int order;

  Education({
    this.id,
    required this.school,
    required this.degree,
    this.fieldOfStudy,
    required this.period,
    required this.finished,
    required this.order,
  });

  factory Education.fromMap(Map<String, dynamic> map, String id) {
    return Education(
      id: id,
      school: map['school'] ?? '',
      degree: map['degree'] ?? '',
      fieldOfStudy: map['fieldOfStudy'],
      period: map['period'] ?? '',
      finished: map['finished'] ?? false,
      order: map['order'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'school': school,
      'degree': degree,
      'fieldOfStudy': fieldOfStudy,
      'period': period,
      'finished': finished,
      'order': order,
    };
  }
}
