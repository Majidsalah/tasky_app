import 'package:flutter/cupertino.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';

class ColoredFlagWidget extends StatelessWidget {
  const ColoredFlagWidget({
    super.key,
    required this.priority,
    required this.date,
  });
  final String priority;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(CupertinoIcons.flag, color: getFlagColor(), size: 16),
        const Spacer(flex: 1),
        Text(priority,
            style: textStyle12.copyWith(
                color: getFlagColor(), fontWeight: FontWeight.bold)),
        const Spacer(flex: 40),
        Text(date, style: textStyle12)
      ],
    );
  }

  getFlagColor() {
    switch (priority.characters.first) {
      case 'm' || 'M':
        return kPrimaryColor;
      case "h" || 'H':
        return kOrangeColor;
      default:
        return kBlueColor;
    }
  }
}
