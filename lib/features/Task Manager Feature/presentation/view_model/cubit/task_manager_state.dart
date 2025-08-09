part of 'task_manager_cubit.dart';

@immutable
sealed class TaskManagerState {}

final class TaskManagerInitial extends TaskManagerState {}

final class TaskManagerStarted extends TaskManagerState {
  final String taskId;
  TaskManagerStarted(this.taskId);
}

final class TaskManagerCompleted extends TaskManagerState {
  final String taskId;
  TaskManagerCompleted(this.taskId);
}

final class TaskManagerNotCompleted extends TaskManagerState {
  final String taskId;
  TaskManagerNotCompleted(this.taskId);
}
