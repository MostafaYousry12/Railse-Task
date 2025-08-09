import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_card.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_list_view.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view_model/cubit/task_manager_cubit.dart';

class TaskManagerViewBody extends StatelessWidget {
  const TaskManagerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = TaskManagerCubit();
        cubit.loadInitialTasks();
        return cubit;
      },
      child: Scaffold(body: const TaskListView()),
    );
    ;
  }
}
