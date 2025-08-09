import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/cubit/task_manager_cubit.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
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

  Future<void> _pickDate(BuildContext context) async {
    if (task.status == TaskStatus.completed) return;

    final newDate = await showDatePicker(
      context: context,
      initialDate: task.startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      context.read<TaskManagerCubit>().updateTaskStartDate(task.id, newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskManagerCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            _buildStatusWidget(task),
            const SizedBox(width: 5),
            InkWell(
              onTap: () => _pickDate(context),
              child: Icon(
                FontAwesomeIcons.penToSquare,
                color: Colors.grey.withOpacity(.8),
                size: 16,
              ),
            ),
          ],
        ),

        Text(
          "Started : ${task.startDate}",
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
              )
            : Row(
                children: [
                  Icon(Icons.check, size: 13, color: kOrderName),
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

  Widget _buildStatusWidget(Task task) {
    switch (task.status) {
      case TaskStatus.notStarted:
        return Text(
          "Due - ${task.startDate}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderNotStarted,
          ),
        );

      case TaskStatus.started:
        final deadlineText = task.deadline != null
            ? "Overdue - ${task.deadline}"
            : "Started";
        return Text(
          deadlineText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderOverDue,
          ),
        );

      case TaskStatus.completed:
        return Text(
          "Completed - ${task.startDate}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderCompleted,
          ),
        );

      default:
        return SizedBox.shrink();
    }
  }
}
