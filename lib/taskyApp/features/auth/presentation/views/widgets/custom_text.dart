import 'package:flutter/cupertino.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';


class CustomText extends StatelessWidget {
  const CustomText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: textStyle24),
        ],
      ),
    );
  }
}
