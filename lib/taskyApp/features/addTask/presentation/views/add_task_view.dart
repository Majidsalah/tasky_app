import 'package:flutter/material.dart';
import 'package:task/taskyApp/features/addTask/presentation/views/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AddTaskViewBody(),
      ),
    );
  }
}
