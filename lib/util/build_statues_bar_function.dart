import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
import 'package:railse_task/util/constants.dart';

Color getStatusColor(TaskStatus status) {
  switch (status) {
    case TaskStatus.notStarted:
      return kDescriptionColor;
    case TaskStatus.started:
      return kOrderName;
    case TaskStatus.completed:
      return Colors.green;
  }
}

Widget buildStatusBar(TaskStatus status) {
  switch (status) {
    case TaskStatus.notStarted:
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => Container(
            width: 5,
            height: 16,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6)),
          ),
        ),
      );

    case TaskStatus.started:
      return Container(
        width: 5,
        height: 60,
        decoration: BoxDecoration(
          color: kOrderName,
          borderRadius: BorderRadius.circular(2),
        ),
      );

    case TaskStatus.completed:
      return Container(
        width: 5,
        height: 60,
        decoration: BoxDecoration(
          color: kOrderCompleted,
          borderRadius: BorderRadius.circular(2),
        ),
      );

    default:
      return SizedBox.shrink();
  }
}
