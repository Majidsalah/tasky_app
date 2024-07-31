import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/utiles/constanst.dart';
import 'package:task/core/utiles/go_router.dart';
import 'package:task/features/home/presentaion/views/widgets/colored_flag_widget.dart';
import 'package:task/features/home/presentaion/views/widgets/colored_status_container.dart';

class HomeTaskListItem extends StatelessWidget {
  const HomeTaskListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kTaskDetailsView),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, bottom: 8, top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
                child: Image.asset(appLogo)),
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
                              "my task have to be done",
                              style: textStyle16)),
                      const Spacer(flex: 1),
                      const ColoredStatusContainer()
                    ]),
                    const SizedBox(height: 6),
                    Text(
                        overflow: TextOverflow.ellipsis,
                        'jxsjsjxsjsxsxsklxsklsk;kj;df;jfs;hfwhfwfsklsk',
                        style: textStyle14),
                    const SizedBox(height: 6),
                    const ColoredFlagWidget(priority: 'Heigh')
                  ],
                ),
              ),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined, size: 24))
          ],
        ),
      ),
    );
  }
}
