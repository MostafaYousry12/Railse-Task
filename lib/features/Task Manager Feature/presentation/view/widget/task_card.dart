import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card_left_section.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card_right_section.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/cubit/task_manager_cubit.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/task_manager_model/task_model.dart';
import 'package:railse_task/util/build_statues_bar_function.dart';
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
                  child: buildStatusBar(currentTask.status),
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
}
