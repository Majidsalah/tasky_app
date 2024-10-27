import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/features/home/presentaion/manager/cubit/home_tasks_cubit.dart';

// ignore: must_be_immutable
class StatusTabBar extends StatefulWidget {
  StatusTabBar({super.key, required this.selectedStatus});
  String? selectedStatus;
  @override
  State<StatusTabBar> createState() => _StatusTabBarState();
}

class _StatusTabBarState extends State<StatusTabBar> {
  List<String> statusTabBarlist = ['All', "Inprogress", 'Waiting', 'Finished'];
  int isClicked = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: statusTabBarlist.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    isClicked = index;
                  });
                  await BlocProvider.of<HomeTasksCubit>(context)
                      .getTasksList(statusTabBarlist[index].toLowerCase());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color:
                            isClicked == index ? kPrimaryColor : kSecondryColor,
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      statusTabBarlist[index],
                      style: isClicked == index
                          ? textStyle16.copyWith(color: Colors.white)
                          : textStyle16.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
