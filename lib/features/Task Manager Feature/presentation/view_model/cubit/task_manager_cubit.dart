import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show listEquals;
import 'package:meta/meta.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';

part 'task_manager_state.dart';

class TaskManagerCubit extends Cubit<TaskManagerState> {
  TaskManagerCubit() : super(TaskManagerInitial([]));

  void _loadInitialTasks() {
    emit(
      TaskManagerInitial([
        Task(
          id: 'Order-1043',
          title: 'Arrange Pickup',
          assignedTo: 'Sandhya',
          status: TaskStatus.started,
          startDate: DateTime.parse('2025-08-10'),
          deadline: DateTime.now().add(Duration(hours: 10, minutes: 5)),
        ),
        Task(
          id: 'Entity-2559',
          title: 'Adhoc Task',
          assignedTo: 'Arman',
          status: TaskStatus.started,
          startDate: DateTime.parse('2025-08-12'),
          deadline: DateTime.now().add(Duration(hours: 16, minutes: 4)),
        ),
        Task(
          id: 'Order-1020',
          title: 'Collect Payment',
          assignedTo: 'Sandhya',
          status: TaskStatus.started,
          startDate: DateTime.parse('2025-08-15'),
          deadline: DateTime.now().add(Duration(hours: 17, minutes: 2)),
        ),
        Task(
          id: 'Order-194',
          title: 'Arrange Delivery',
          assignedTo: 'Prashant',
          status: TaskStatus.completed,
          startDate: DateTime.parse('2025-08-20'),
        ),
        Task(
          id: 'Entity-2184',
          title: 'Share Company Profile',
          assignedTo: 'Asif Khan K',
          status: TaskStatus.completed,
          startDate: DateTime.parse('2025-08-22'),
        ),
        Task(
          id: 'Entity-472',
          title: 'Add Followup',
          assignedTo: 'Avik',
          status: TaskStatus.completed,
          startDate: DateTime.parse('2025-08-26'),
        ),
        Task(
          id: 'Enquiry-3563',
          title: 'Convert Enquiry',
          assignedTo: 'Prashant',
          status: TaskStatus.notStarted,
          startDate: DateTime.parse('2025-08-28'),
          deadline: DateTime.now().add(Duration(days: 2)),
        ),
        Task(
          id: 'Order-176',
          title: 'Arrange Pickup',
          assignedTo: 'Prashant',
          priority: "High Priority",
          status: TaskStatus.notStarted,
          startDate: DateTime.now().add(Duration(days: 1)), // Due Tomorrow
        ),
      ]),
    );
  }

  void startTask(String taskId) {
    if (state is TaskManagerInitial) {
      final currentTasks = (state as TaskManagerInitial).tasks;
      final updatedTasks = currentTasks.map((task) {
        if (task.id == taskId && task.status == TaskStatus.notStarted) {
          return task.copyWith(status: TaskStatus.started);
        }
        return task;
      }).toList();
      emit(TaskManagerInitial(updatedTasks));
    }
  }

  void markTaskAsComplete(String taskId) {
    if (state is TaskManagerInitial) {
      final currentTasks = (state as TaskManagerInitial).tasks;
      final updatedTasks = currentTasks.map((task) {
        if (task.id == taskId && task.status == TaskStatus.started) {
          return task.copyWith(status: TaskStatus.completed);
        }
        return task;
      }).toList();
      emit(TaskManagerInitial(updatedTasks));
    }
  }

  void updateTaskStartDate(String taskId, DateTime newDate) {
    if (state is TaskManagerInitial) {
      final currentTasks = (state as TaskManagerInitial).tasks;
      final updatedTasks = currentTasks.map((task) {
        if (task.id == taskId &&
            (task.status == TaskStatus.notStarted ||
                task.status == TaskStatus.started)) {
          return task.copyWith(startDate: newDate);
        }
        return task;
      }).toList();
      emit(TaskManagerInitial(updatedTasks));
    }
  }
}
