import 'package:flutter/material.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/widget/task_manager_view_body.dart';

class TaskManagerView extends StatelessWidget {
  const TaskManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: TaskManagerViewBody()));
  }
}
