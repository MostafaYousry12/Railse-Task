import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/cubit/task_manager_cubit.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
import 'package:railse_task/util/build_statues_widget_function.dart';
import 'package:railse_task/util/constants.dart';

class TaskCardRightSection extends StatefulWidget {
  const TaskCardRightSection({super.key, required this.task});

  final Task task;

  @override
  State<TaskCardRightSection> createState() => _TaskCardRightSectionState();
}

class _TaskCardRightSectionState extends State<TaskCardRightSection> {
  late Task task;

  @override
  void initState() {
    super.initState();
    task = widget.task;
  }

  Future<DateTime?> _pickDate(BuildContext context) async {
    if (task.status == TaskStatus.completed) return null;

    return await showDatePicker(
      context: context,
      initialDate: task.startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskManagerCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            buildStatusWidget(task),
            const SizedBox(width: 5),
            InkWell(
              onTap: () async {
                final newDate = await _pickDate(context);
                if (newDate != null) {
                  setState(() {
                    task = task.copyWith(startDate: newDate);
                  });
                  context.read<TaskManagerCubit>().updateTaskStartDate(
                    task.id,
                    newDate,
                  );
                }
              },
              child: Icon(
                FontAwesomeIcons.penToSquare,
                color: Colors.grey.withOpacity(.8),
                size: 16,
              ),
            ),
          ],
        ),

        Text(
          "Started : ${DateFormat('MMM d').format(task.startDate!)}",
          style: TextStyle(
            color: kDescriptionColor.withOpacity(.7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 15),
        task.status == TaskStatus.started
            ? InkWell(
                onTap: () {
                  context.read<TaskManagerCubit>().markTaskAsComplete(task.id);
                },
                child: Row(
                  children: [
                    Icon(Icons.check, size: 14, color: kOrderCompleted),
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
              )
            : Row(
                children: [
                  Icon(Icons.play_circle, size: 13, color: kOrderName),
                  SizedBox(width: 5),
                  Text(
                    "Start Task",
                    style: TextStyle(
                      color: kOrderName,
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
