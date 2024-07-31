
import 'package:flutter/cupertino.dart';
import 'package:task/core/widgets/app_Image.dart';
import 'package:task/features/auth/presentation/views/widgets/custom_text.dart';

class StackedText extends StatelessWidget {
  const StackedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomLeft, children: [
       AppImage(),
      CustomText(text: "Sign Up",),
    ]);
  }
}