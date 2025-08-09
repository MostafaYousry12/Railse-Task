import 'package:flutter/material.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card_left_section.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card_right_section.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [TaskCardLeftSection(), TaskCardRightSection()],
        ),
      ),
    );
  }
}
