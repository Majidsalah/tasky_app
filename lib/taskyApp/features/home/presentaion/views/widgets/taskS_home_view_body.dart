import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/features/home/presentaion/manager/cubit/home_tasks_cubit.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/home_tasks_list_view.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/home_view_app_bar.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/status_tab_bar_widget.dart';

class TasksHomeViewBody extends StatefulWidget {
  const TasksHomeViewBody({super.key});

  @override
  State<TasksHomeViewBody> createState() => _TasksHomeViewBodyState();
}

class _TasksHomeViewBodyState extends State<TasksHomeViewBody> {
  String? selectedStatus;
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
        StatusTabBar(
          selectedStatus: selectedStatus,
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                  const Duration(seconds: 1),
                  () => BlocProvider.of<HomeTasksCubit>(context)
                      .getTasksList('all'));
            },
            child: const HomeTasksListView(),
          ),
        ),
      ],
    );
  }
}
