import 'package:flutter/material.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
import 'package:railse_task/util/constants.dart';

class TaskCardLeftSection extends StatelessWidget {
  const TaskCardLeftSection({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              task.id,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kOrderName,
                decoration: TextDecoration.underline,
                decorationColor: kOrderName,
                decorationThickness: 2,
              ),
            ),
            const SizedBox(width: 5),
            Icon(Icons.more_vert, color: Colors.grey.withOpacity(.8)),
          ],
        ),
        Text(
          task.title,
          style: TextStyle(
            color: kDescriptionColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              task.assignedTo,
              style: TextStyle(
                color: kDescriptionColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),
            task.priority != null
                ? Text(
                    "High Priority",
                    style: TextStyle(
                      color: kOrderOverDue,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                : Text(""),
          ],
        ),
      ],
    );
  }
}
