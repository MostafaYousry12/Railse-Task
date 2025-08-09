import 'package:flutter/material.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card_left_section.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card_right_section.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: 5,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6), // red dot color
                      // make circle dots
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            TaskCardLeftSection(),

            Spacer(flex: 1),
            TaskCardRightSection(),
          ],
        ),
      ),
    );
  }
}
