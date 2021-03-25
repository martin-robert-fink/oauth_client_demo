import 'dart:convert';
import 'package:uuid/uuid.dart';

class Task {
  Task({
    this.id,
    required this.description,
    required this.detail,
    required this.startDate,
    required this.dueDate,
    required this.complete,
    required this.priority,
  }) {
    id ??= Uuid().v4();
  }

  String? id;
  final String description;
  final String detail;
  final DateTime? startDate;
  final DateTime? dueDate;
  final int complete; // 0 to 100
  final int priority; // 0 to 5

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['_id'],
        description: json['description'],
        detail: json['detail'],
        startDate: (json['startDate'] == null)
            ? null
            : DateTime.parse(json['startDate']),
        dueDate:
            (json['dueDate'] == null) ? null : DateTime.parse(json['dueDate']),
        complete: json['complete'],
        priority: json['priority'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'description': description,
        'detail': detail,
        'startDate': startDate?.toIso8601String(),
        'dueDate': dueDate?.toIso8601String(),
        'complete': complete,
        'priority': priority,
      };

  @override
  String toString() => jsonEncode(this.toJson());
}
