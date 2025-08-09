import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:railse_task/util/constants.dart';

class TaskCardRightSection extends StatelessWidget {
  const TaskCardRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            const Text(
              "Overdue - 10h 5m",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: kOrderOverDue,
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {},
              child: Icon(
                FontAwesomeIcons.penToSquare,
                color: Colors.grey.withOpacity(.8),
                size: 16,
              ),
            ),
          ],
        ),

        Text(
          "Started : Aug 10",
          style: TextStyle(
            color: kDescriptionColor.withOpacity(.7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 15),
        const Row(
          children: [
            Icon(Icons.check, size: 13, color: kOrderCompleted),
            SizedBox(width: 5),
            Text(
              "Mark as Completed",
              style: TextStyle(
                color: kOrderCompleted,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
