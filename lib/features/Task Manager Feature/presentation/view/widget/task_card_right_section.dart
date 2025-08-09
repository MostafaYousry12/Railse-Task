import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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
            _buildStatusWidget(task),
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

  Widget _buildStatusWidget(Task task) {
    final dateFormatter = DateFormat('MMM d');

    String _formatDueDate(DateTime dueDate) {
      final now = DateTime.now();
      final diff = dueDate.difference(now);

      if (diff.inDays > 0 && diff.inDays <= 3) {
        return "Due in ${diff.inDays} day${diff.inDays > 1 ? 's' : ''}";
      } else if (diff.inDays == 0 && diff.inHours > 0) {
        return "Overdue ${diff.inHours}h ${diff.inMinutes.remainder(60)}m";
      } else if (diff.isNegative) {
        return "Overdue";
      }
      return "Overdue - ${dateFormatter.format(dueDate)}";
    }

    switch (task.status) {
      case TaskStatus.notStarted:
        return Text(
          task.deadline != null
              ? _formatDueDate(task.deadline!)
              : "Due - ${task.startDate != null ? dateFormatter.format(task.startDate!) : ''}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderNotStarted,
          ),
        );

      case TaskStatus.started:
        final deadlineText = task.deadline != null
            ? _formatDueDate(task.deadline!)
            : "Started";
        return Text(
          deadlineText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderOverDue,
          ),
        );

      case TaskStatus.completed:
        final completedDate = task.completedDate ?? task.startDate;
        final isToday =
            completedDate != null &&
            DateUtils.isSameDay(completedDate, DateTime.now());
        return Text(
          isToday
              ? "Completed Today"
              : "Completed - ${completedDate != null ? dateFormatter.format(completedDate) : ''}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kOrderCompleted,
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
