import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/utiles/go_router.dart';
import 'package:task/core/widgets/custom_app_button.dart';
import 'package:task/core/widgets/app_Image.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Expanded(
                child: AppImage(),
              ),
              Text('Task Management &\nTo-Do List',
                  style: textStyle24, textAlign: TextAlign.center),
              const SizedBox(
                height: 16,
              ),
              Opacity(
                  opacity: 0.6,
                  child: Text(
                      'This productive tool is designed to help\nyou better manage your task\n project-wise conveniently!',
                      style: textStyle14,
                      textAlign: TextAlign.center)),
              const SizedBox(height: 32),
              CustomAppButton(
                onPressed: () =>
                    GoRouter.of(context).push(AppRouter.kLoginView),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Let\'s Start',
                        style: textStyle16.copyWith(
                            fontSize: 19, color: Colors.white)),
                    const SizedBox(width: 8),
                    const Icon(IconlyBold.arrow_right, color: Colors.white)
                  ],
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
