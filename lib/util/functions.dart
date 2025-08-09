import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
import 'package:railse_task/util/constants.dart';

class Functions {
  Color getCardColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return kOrderNotStarted;
      case TaskStatus.started:
        return kOrderOverDue;
      case TaskStatus.completed:
        return kOrderCompleted;
      default:
        return kDescriptionColor;
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'No Date';
    return DateFormat('MMM dd').format(date);
  }

  String getOverdueText(DateTime? deadline, TaskStatus status) {
    if (status == TaskStatus.completed || deadline == null) return '';

    final now = DateTime.now();
    if (deadline.isBefore(now)) {
      final difference = now.difference(deadline);
      return 'Overdue - ${difference.inHours}h ${difference.inMinutes.remainder(60)}m';
    } else {
      final difference = deadline.difference(now);
      if (difference.inDays > 0) {
        return 'Due in ${difference.inDays} days';
      } else if (difference.inHours > 0) {
        return 'Due in ${difference.inHours}h ${difference.inMinutes.remainder(60)}m';
      } else if (difference.inMinutes > 0) {
        return 'Due in ${difference.inMinutes}m';
      }
    }
    return '';
  }
}
