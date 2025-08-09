import 'package:flutter/material.dart';
import 'package:railse_task/util/constants.dart';

class TaskCardLeftSection extends StatelessWidget {
  const TaskCardLeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Order-1043",
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
        const Text(
          "Arrange PickUp",
          style: TextStyle(
            color: kDescriptionColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Text(
              "Sandhya",
              style: TextStyle(
                color: kDescriptionColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "High Priority",
              style: TextStyle(
                color: kOrderOverDue,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
