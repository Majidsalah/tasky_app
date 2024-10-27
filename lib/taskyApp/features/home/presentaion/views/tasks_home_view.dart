import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/taskyApp/features/home/presentaion/manager/cubit/home_tasks_cubit.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/custom_floating_buttons.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/taskS_home_view_body.dart';

class TasksHomeView extends StatelessWidget {
  const TasksHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeTasksCubit()..getTasksList('all'),
        child: const Scaffold(
          floatingActionButton: CustomFloatingButtons(),
          body: TasksHomeViewBody(),
        ),
      ),
    );
  }
}
