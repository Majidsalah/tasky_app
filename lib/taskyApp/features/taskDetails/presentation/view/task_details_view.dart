import 'package:flutter/material.dart';
import 'package:task/taskyApp/features/taskDetails/presentation/view/widgets/task_details_view_body.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: TaskDetailsViewBody(),
      ),
    );
  }
}
