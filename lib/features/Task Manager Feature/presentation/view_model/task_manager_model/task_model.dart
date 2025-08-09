enum TaskStatus { notStarted, started, completed }

class Task {
  final String id;
  final String title;
  final String description;
  final String assignedTo;
  final bool highPriority;
  DateTime startDate;
  TaskStatus status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.assignedTo,
    this.highPriority = false,
    required this.startDate,
    this.status = TaskStatus.notStarted,
  });
}
