import 'dart:ui';

enum TaskStatus { notStarted, started, completed }

class Task {
  final String id;
  final String title;
  final String assignedTo;
  final TaskStatus status;
  final DateTime? startDate;
  final DateTime? deadline;
  final String? priority;
  final Color? containerColor;

  Task({
    required this.id,
    required this.title,
    required this.assignedTo,
    this.status = TaskStatus.notStarted,
    this.startDate,
    this.deadline,
    this.priority,
    this.containerColor,
  });

  Task copyWith({
    String? id,
    String? title,
    String? assignedTo,
    TaskStatus? status,
    DateTime? startDate,
    DateTime? deadline,
    String? priority,
    Color? containerColor,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      assignedTo: assignedTo ?? this.assignedTo,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      containerColor: containerColor ?? this.containerColor,
    );
  }
}
