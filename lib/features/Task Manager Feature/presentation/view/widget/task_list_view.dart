import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/cubit/task_manager_cubit.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagerCubit, TaskManagerState>(
      builder: (context, state) {
        final tasks = state.tasks;
        if (tasks.isEmpty) {
          return Center(child: Text("No tasks available"));
        }
        return ListView.builder(
          itemCount: state.tasks.length,
          itemBuilder: (context, index) {
            final task = state.tasks[index];
            return Padding(
              padding: EdgeInsets.zero,
              child: TaskCard(task: task),
            );
          },
        );
      },
    );
  }
}
