import 'package:flutter/material.dart';
import 'package:railse_task/features/Task%20Manager%20Feature/presentation/view/task_manager_view.dart';

void main() {
  runApp(const MainView());
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: TaskManagerView(),
    );
  }
}
