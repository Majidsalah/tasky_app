import 'package:flutter/material.dart';
import 'package:task/features/home/presentaion/views/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AddTaskViewBody(),
      ),
    );
  }
}
