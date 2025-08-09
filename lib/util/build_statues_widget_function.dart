import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
import 'package:railse_task/util/constants.dart';

Widget buildStatusWidget(Task task) {
  final dateFormatter = DateFormat('MMM d');

  String formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final diff = dueDate.difference(now);

    if (diff.inDays > 0 && diff.inDays <= 3) {
      return "Due in ${diff.inDays} day${diff.inDays > 1 ? 's' : ''}";
    } else if (diff.inDays == 0 && diff.inHours > 0) {
      return "Overdue ${diff.inHours}h ${diff.inMinutes.remainder(60)}m";
    } else if (diff.isNegative) {
      return "Overdue";
    }
    return "Overdue - ${dateFormatter.format(dueDate)}";
  }

  switch (task.status) {
    case TaskStatus.notStarted:
      return Text(
        task.deadline != null
            ? formatDueDate(task.deadline!)
            : "Due - ${task.startDate != null ? dateFormatter.format(task.startDate!) : ''}",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: kOrderNotStarted,
        ),
      );

    case TaskStatus.started:
      final deadlineText = task.deadline != null
          ? formatDueDate(task.deadline!)
          : "Started";
      return Text(
        deadlineText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: kOrderOverDue,
        ),
      );

    case TaskStatus.completed:
      final completedDate = task.completedDate ?? task.startDate;
      final isToday =
          completedDate != null &&
          DateUtils.isSameDay(completedDate, DateTime.now());
      return Text(
        isToday
            ? "Completed Today"
            : "Completed - ${completedDate != null ? dateFormatter.format(completedDate) : ''}",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: kOrderCompleted,
        ),
      );

    default:
      return const SizedBox.shrink();
  }
}
