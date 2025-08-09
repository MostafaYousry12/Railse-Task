part of 'task_manager_cubit.dart';

@immutable
sealed class TaskManagerState {
  List<Task> get tasks;
}

final class TaskManagerInitial extends TaskManagerState {
  final List<Task> tasks;
  TaskManagerInitial(this.tasks);
}
