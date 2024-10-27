import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/success_widget.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';
import 'package:task/taskyApp/features/home/presentaion/manager/cubit/home_tasks_cubit.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/home_task_list_item.dart';
import 'package:task/taskyApp/features/taskDetails/presentation/manager/cubit/delete_cubit.dart';

class HomeTasksListView extends StatefulWidget {
  const HomeTasksListView({super.key});

  @override
  State<HomeTasksListView> createState() => _HomeTasksListViewState();
}

bool _loading = false;

class _HomeTasksListViewState extends State<HomeTasksListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTasksCubit, HomeTasksState>(
      builder: (context, state) {
        if (state is HomeTasksLoading) {
          _loading = true;
          return Skeletonizer(
            enabled: _loading,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) => const SkeletonListItem()),
          );
        } else if (state is HomeTasksFailed) {
          if (state is HomeTasksRefresh) {
            return const MessageWidget(message: 'Please Waiting');
          }
          return MessageWidget(message: state.errorMessage);
        } else if (state is HomeTasksSuccess) {
          _loading = false;
          return state.homeTasksList.isNotEmpty
              ? Skeletonizer(
                  enabled: _loading,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.homeTasksList.length,
                      itemBuilder: (_, index) {
                        if (index >= state.homeTasksList.length) {
                          return const SizedBox.shrink();
                        }
                        return Slidable(
                          startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => dialog(
                                          'Cancel',
                                          'Delete',
                                          context,
                                          state.homeTasksList[index].id!,
                                          state.homeTasksList,
                                          index),
                                    );
                                    // setState(() {
                                    //   state.homeTasksList.removeWhere((task) =>
                                    //       task == state.homeTasksList[index]);
                                    // });
                                  },
                                  backgroundColor:
                                      const Color.fromARGB(255, 243, 5, 5),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ]),
                          child: HomeTaskListItem(
                              task: state.homeTasksList[index]),
                        );
                      }),
                )
              : Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/task.png',
                      height: 200,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'There is no tasks yet !\n Start Planning Your Tasks Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ));
        }

        return const Center(
            child: Text(
          'There was an error',
          textAlign: TextAlign.center,
        ));
      },
    );
  }

  dialog(String button1, String button2, BuildContext context, String id,
      List<TasksModel> homeTasksList, int index) {
    return BlocProvider(
      create: (context) => DeleteCubit(),
      child: AlertDialog(
        title: Center(
            child: Text("Are you sure you want to delete this task?",
                style: textStyle16.copyWith(color: kPrimaryColor))),
        backgroundColor: Colors.white,
        actions: [
          BlocConsumer<DeleteCubit, DeleteState>(
            listener: (context, state) {
              if (state is DeleteTaskSuccess) {
                setState(() {
                  homeTasksList.removeAt(index);
                });
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is DeleteTaskLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DeleteTaskFailure) {
                return const MessageWidget(
                    message: 'Failed to delete the task ❌❌');
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(child: Text(button1, style: textStyle16))),
                  const Spacer(flex: 1),
                  TextButton(
                      onPressed: () async {
                        await BlocProvider.of<DeleteCubit>(context)
                            .deleteTask(id);
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
}
