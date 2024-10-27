import 'package:flutter/material.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';
import 'package:task/taskyApp/features/taskDetails/presentation/view/widgets/task_details_view_body.dart';

class TaskDetailsView extends StatefulWidget {
  const TaskDetailsView({super.key, required this.task});
  final TasksModel task;

  @override
  State<TaskDetailsView> createState() => _TaskDetailsViewState();
}

class _TaskDetailsViewState extends State<TaskDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TaskDetailsViewBody(
          task: widget.task,
        ),
      ),
    );
  }
}
