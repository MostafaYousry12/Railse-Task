import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card_left_section.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card_right_section.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/cubit/task_manager_cubit.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
import 'package:railse_task/util/constants.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagerCubit, TaskManagerState>(
      builder: (context, state) {
        final currentTask = state.tasks.firstWhere(
          (t) => t.id == task.id,
          orElse: () => task,
        );

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
                  child: _buildStatusBar(currentTask.status),
                ),
                SizedBox(width: 10),
                TaskCardLeftSection(task: currentTask),

                Spacer(flex: 1),
                TaskCardRightSection(task: currentTask),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return kDescriptionColor;
      case TaskStatus.started:
        return kOrderName;
      case TaskStatus.completed:
        return Colors.green;
    }
  }

  Widget _buildStatusBar(TaskStatus status) {
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
}
