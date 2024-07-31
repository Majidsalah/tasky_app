import 'package:flutter/material.dart';
import 'package:task/core/utiles/constanst.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        appImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
