import 'package:flutter/material.dart';
import 'package:task/core/utiles/constanst.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key, required this.child, required this.onPressed});
  final Widget child;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 331,
      child: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: kPrimaryColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
