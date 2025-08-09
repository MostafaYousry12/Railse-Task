import 'dart:ui';

enum TaskStatus { notStarted, started, completed }

class Task {
  final String id;
  final String title;
  final String assignedTo;
  final TaskStatus status;
  final DateTime? startDate;
  final DateTime? deadline;
  final DateTime? completedDate;
  final String? priority;

  Task({
    required this.id,
    required this.title,
    required this.assignedTo,
    required this.status,
    this.startDate,
    this.deadline,
    this.completedDate,
    this.priority,
  });

  Task copyWith({
    String? id,
    String? title,
    String? assignedTo,
    TaskStatus? status,
    DateTime? startDate,
    DateTime? deadline,
    DateTime? completedDate,
    String? priority,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      assignedTo: assignedTo ?? this.assignedTo,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      deadline: deadline ?? this.deadline,
      completedDate: completedDate ?? this.completedDate,
      priority: priority ?? this.priority,
    );
  }
}
