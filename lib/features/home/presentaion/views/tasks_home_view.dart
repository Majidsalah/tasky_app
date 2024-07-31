import 'package:flutter/material.dart';
import 'package:task/features/home/presentaion/views/widgets/custom_floating_buttons.dart';
import 'package:task/features/home/presentaion/views/widgets/taskS_home_view_body.dart';

class TasksHomeView extends StatelessWidget {
  const TasksHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        floatingActionButton: CustomFloatingButtons(),
        body: TasksHomeViewBody(),
      ),
    );
  }
}
