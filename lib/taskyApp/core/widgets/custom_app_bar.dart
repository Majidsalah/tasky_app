import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/success_widget.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';
import 'package:task/taskyApp/features/taskDetails/presentation/manager/cubit/edit_task_cubit.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      required this.title,
      this.leadingIcon = false,
      this.task,
      this.taskTitle,
      this.desc,
      this.priority,
      this.status});
  final String title;
  final bool leadingIcon;
  TasksModel? task;
  String? taskTitle;
  String? desc;
  String? priority;
  String? status;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(
              IconlyBold.arrow_left,
              color: Colors.black,
            )),
        Text(
          title,
          style: textStyle16,
        ),
        const Spacer(flex: 1),
        leadingIcon
            ? CustomPopupMenuButton(
                task: task!,
                title: taskTitle,
                desc: desc,
                priority: priority,
                status: status,
              )
            : const Text(''),
      ],
    );
  }
}

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.task,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
  });
  final TasksModel task;
  final String? title;
  final String? desc;
  final String? priority;
  final String? status;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        constraints: const BoxConstraints(
          maxWidth: 100,
        ),
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        position: PopupMenuPosition.under,
        icon:
            const Icon(Icons.more_vert_outlined, size: 24, color: Colors.black),
        itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => dialog('Edit', 'Cancel', context),
                  );
                },
                child: Center(
                    child: Text('Edit',
                        style: textStyle16.copyWith(
                            fontSize: 18, color: kOrangeColor))),
              ),
            ]);
  }

  dialog(String button1, String button2, BuildContext context) {
    return BlocProvider(
      create: (context) => EditTaskCubit(),
      child: AlertDialog(
        title: Center(
            child: Text("Are Sure Editing this Task ?",
                style: textStyle16.copyWith(color: kPrimaryColor))),
        backgroundColor: Colors.white,
        actions: [
          BlocBuilder<EditTaskCubit, EditTaskState>(
            builder: (context, state) {
              if (state is EditTaskSuccess) {
                return Column(
                  children: [
                    Lottie.asset(
                        'assets/animation/Animation - 1725384520524.json',
                        width: 100,
                        height: 100,
                        animate: true,
                        repeat: true,
                        frameRate: FrameRate.max),
                    const MessageWidget(message: ' Task Edit Successfully'),
                  ],
                );
              } else if (state is EditTaskFailure) {
                return const MessageWidget(
                    message: 'Failed to edit the task ❌❌');
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () async {
                        // log(title.toString());
                        // log(desc.toString());
                        // log(priority.toString());
                        // log(status.toString());
                        // log(task.id.toString());
                        await BlocProvider.of<EditTaskCubit>(context).editTask(
                            title!,
                            desc!,
                            p(priority ?? 'High Priority'),
                            s(status ?? 'Inprogress'),
                            task.id!);
                      },
                      child: Center(
                          child: Text(button1,
                              style:
                                  textStyle16.copyWith(color: Colors.green)))),
                  const Spacer(flex: 1),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: Text(button2,
                              style: textStyle16.copyWith(color: Colors.red)))),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  String p(String newPriority) {
    String nP = newPriority.split(' ')[0];
    return nP.toLowerCase();
  }

  String s(String newStatus) {
    String nP = newStatus.toLowerCase();
    return nP;
  }
}
