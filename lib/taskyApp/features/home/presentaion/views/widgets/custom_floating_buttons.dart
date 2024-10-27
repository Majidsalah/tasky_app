import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/core/utiles/go_router.dart';

class CustomFloatingButtons extends StatelessWidget {
  const CustomFloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          shape: const CircleBorder(),
          heroTag: null,
          backgroundColor: kPrimaryColor,
          onPressed: () => GoRouter.of(context).push(AppRouter.kAddTaskView),
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
        // const SizedBox(height: 16),
      ],
    );
  }
}
