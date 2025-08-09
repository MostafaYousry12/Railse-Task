import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
import 'package:railse_task/util/constants.dart';

Widget buildStatusWidget(Task task) {
  final dateFormatter = DateFormat('MMM d');

  String formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final diff = dueDate.difference(now);

    if (diff.isNegative) {
      // Overdue
      final absDiff = diff.abs();
      if (absDiff.inDays > 0) {
        return "Overdue ${absDiff.inDays} day${absDiff.inDays > 1 ? 's' : ''}";
      } else if (absDiff.inHours > 0) {
        return "Overdue ${absDiff.inHours}h ${absDiff.inMinutes.remainder(60)}m";
      } else {
        return "Overdue ${absDiff.inMinutes}m";
      }
    } else if (diff.inDays > 0) {
      return "Overdue in ${diff.inDays} day${diff.inDays > 1 ? 's' : ''}";
    } else if (diff.inHours > 0) {
      return "Overdue in ${diff.inHours}h ${diff.inMinutes.remainder(60)}m";
    } else if (diff.inMinutes > 0) {
      return "Overdue in ${diff.inMinutes}m";
    } else {
      return "Due now";
    }
  }

  String formatStartDate(DateTime startDate) {
    final now = DateTime.now();
    final diff = startDate.difference(now);

    if (diff.isNegative) {
      // Past date
      final absDiff = diff.abs();
      if (absDiff.inDays > 0) {
        return "Due - ${absDiff.inDays} day${absDiff.inDays > 1 ? 's' : ''} ago";
      } else if (absDiff.inHours > 0) {
        return "Due - ${absDiff.inHours}h ${absDiff.inMinutes.remainder(60)}m ago";
      } else {
        return "Due - ${absDiff.inMinutes}m ago";
      }
    } else if (diff.inDays > 0) {
      return "Due in ${diff.inDays} day${diff.inDays > 1 ? 's' : ''}";
    } else if (diff.inHours > 0) {
      return "Due in ${diff.inHours}h ${diff.inMinutes.remainder(60)}m";
    } else if (diff.inMinutes > 0) {
      return "Due in ${diff.inMinutes}m";
    } else {
      return "Due now";
    }
  }

  switch (task.status) {
    case TaskStatus.notStarted:
      if (task.deadline != null) {
        return Text(
          formatDueDate(task.deadline!),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderNotStarted,
          ),
        );
      } else if (task.startDate != null) {
        return Text(
          formatStartDate(task.startDate!),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: task.startDate!.isBefore(DateTime.now())
                ? kOrderOverDue
                : kOrderNotStarted,
          ),
        );
      }
      return const Text(
        "No due date",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: kDescriptionColor,
        ),
      );

    case TaskStatus.started:
      if (task.deadline != null) {
        return Text(
          formatDueDate(task.deadline!),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderOverDue,
          ),
        );
      }
      return const Text(
        "Started",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: kOrderOverDue,
        ),
      );

    case TaskStatus.completed:
      final completedDate = task.startDate;
      if (completedDate != null) {
        final isToday = DateUtils.isSameDay(completedDate, DateTime.now());
        return Text(
          isToday
              ? "Completed Today"
              : "Completed - ${dateFormatter.format(completedDate)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderCompleted,
          ),
        );
      }
      return const Text(
        "Completed",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: kOrderCompleted,
        ),
      );

    default:
      return const SizedBox.shrink();
  }
}
