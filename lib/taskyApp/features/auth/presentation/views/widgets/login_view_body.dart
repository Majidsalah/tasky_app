import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/go_router.dart';
import 'package:task/taskyApp/core/widgets/custom_app_button.dart';
import 'package:task/taskyApp/core/widgets/app_Image.dart';
import 'package:task/taskyApp/core/widgets/custom_text_field.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/have_account_widget.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AppImage(),
          const CustomText(
            text: "Login",
          ),
          CustomTextField(isPhone: true),
          const SizedBox(height: 16),
          CustomTextField(labelText: 'Password...', isPassword: true),
          const SizedBox(height: 16),
          CustomAppButton(
              child: Text('Sign In',
                  style: textStyle16.copyWith(color: Colors.white)),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.khomeView);
              }),
          HaveAnAccountWidget(
            haveAccount: false,
            onPressed: () => GoRouter.of(context).push(AppRouter.kSignUpview),
          )
        ],
      ),
    );
  }
}
