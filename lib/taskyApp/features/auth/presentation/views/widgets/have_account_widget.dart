import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key, required this.haveAccount, required this.onPressed});
  final bool haveAccount;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        haveAccount ? 'Already have an account ?' : 'Don’t have an account?',
        style: textStyle14,
      ),
      TextButton(
          onPressed: onPressed,
          child: Text(haveAccount ? 'Sign In' : 'Sign Up here',
              style: textStyle14.copyWith(
                  fontWeight: FontWeight.w900,
                  color: kPrimaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: kPrimaryColor)))
    ]);
  }
}
