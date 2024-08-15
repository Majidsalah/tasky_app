import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/home_tasks_list_view.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/home_view_app_bar.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/status_tab_bar_widget.dart';

class TasksHomeViewBody extends StatelessWidget {
  const TasksHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeViewAppBar(),
        Align(
            alignment: const Alignment(-0.88, 0),
            child: Text('My Tasks',
                style: textStyle16.copyWith(
                    color: Colors.black.withOpacity(0.60)))),
        const StatusTabBar(),
        const HomeTasksListView()
      ],
    );
  }
}
