import 'package:flutter/material.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/home_task_list_item.dart';

class HomeTasksListView extends StatelessWidget {
  const HomeTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (_, index) {
            return const HomeTaskListItem();
          }),
    );
  }
}