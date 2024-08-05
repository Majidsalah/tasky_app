import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/widgets/custom_app_button.dart';
import 'package:task/taskyApp/core/widgets/custom_drop_down_menu.dart';
import 'package:task/taskyApp/core/widgets/custom_text_field.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/stacked_text.dart';


class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StackedText(text: 'Sign Up'),
          CustomTextField(labelText: 'Name...'),
          const SizedBox(height: 16),
          CustomTextField(labelText: 'Phone...', isPhone: true),
          const SizedBox(height: 16),
          CustomTextField(labelText: 'Years of experience...'),
          const SizedBox(height: 16),
          CustomDropDownButton(option1: 'junior', option2: 'senior', option3: 'fresh'),
          const SizedBox(height: 16),
          CustomTextField(labelText: 'Address...'),
          const SizedBox(height: 16),
          CustomTextField(labelText: 'Password...', isPassword: true),
          const SizedBox(height: 16),
          CustomAppButton(
              child: Text('Sign Up',
                  style: textStyle16.copyWith(color: Colors.white)),
              onPressed: () {}),
          HaveAnAccountWidget(
            haveAccount: true,
            onPressed: () => GoRouter.of(context).pop(),
          )
        ],
      ),
    );
  }
}

