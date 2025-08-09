part of 'task_manager_cubit.dart';

@immutable
sealed class TaskManagerState {}

final class TaskLoading extends TaskManagerState {}

final class TaskManagerInitial extends TaskManagerState {
  final List<Task> tasks;
  TaskManagerInitial(this.tasks);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskManagerInitial && listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => tasks.hashCode;
}

final class TaskError extends TaskManagerState {
  final String message;
  TaskError(this.message);
}
