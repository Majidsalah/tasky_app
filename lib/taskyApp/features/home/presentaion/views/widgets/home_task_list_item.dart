import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:task/taskyApp/core/functions/methods.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/core/utiles/go_router.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/success_widget.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/colored_flag_widget.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/colored_status_container.dart';
import 'package:task/taskyApp/features/taskDetails/presentation/manager/cubit/delete_cubit.dart';

class HomeTaskListItem extends StatelessWidget {
  const HomeTaskListItem({super.key, required this.task});
  final TasksModel task;
  final bool taskHasImage = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kTaskDetailsView, extra: task);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    fadeOutDuration: const Duration(seconds: 2),
                    fadeInDuration: const Duration(seconds: 2),
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(appLogo)),
                    imageUrl:
                        "https://todo.iraqsapp.com/images/${task.image ?? ''}",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      SizedBox(
                          width: 150,
                          child: Text(
                              overflow: TextOverflow.ellipsis,
                              task.title!,
                              style: textStyle16)),
                      const Spacer(flex: 1),
                      ColoredStatusContainer(
                        status: task.status!,
                      )
                    ]),
                    const SizedBox(height: 6),
                    Text(
                        overflow: TextOverflow.ellipsis,
                        task.desc!,
                        style: textStyle14),
                    const SizedBox(height: 6),
                    ColoredFlagWidget(
                      priority: task.priority!,
                      date: formatDate(task.createdAt!),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkeletonListItem extends StatelessWidget {
  const SkeletonListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey[200],
            child: const SizedBox(
              width: 64,
              height: 64,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(
                        width: 150,
                        child: Text(
                            overflow: TextOverflow.ellipsis,
                            " task.title!",
                            style: textStyle16)),
                    const Spacer(flex: 1),
                    const ColoredStatusContainer(
                      status: "task.status!",
                    )
                  ]),
                  const SizedBox(height: 6),
                  Text(
                      overflow: TextOverflow.ellipsis,
                      " task.desc!",
                      style: textStyle14),
                  const SizedBox(height: 6),
                  const ColoredFlagWidget(
                    priority: " task.priority!",
                    date: "formatDate(task.createdAt!)",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
