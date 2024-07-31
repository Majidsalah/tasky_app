import 'package:flutter/cupertino.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/utiles/constanst.dart';

class ColoredFlagWidget extends StatelessWidget {
  const ColoredFlagWidget({
    super.key, required this.priority,
  });
 final String priority;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(CupertinoIcons.flag, color: getFlagColor(), size: 16),
        const SizedBox(width: 4),
        Text(priority,
            style: textStyle12.copyWith(
                color: getFlagColor(),
                fontWeight: FontWeight.bold)),
        const Spacer(flex: 1),
        Text('30/12/2022', style: textStyle12)
      ],
    );
  }

    getFlagColor() {
    switch (priority) {
      case "Medium":
        return kPrimaryColor;
      case "Heigh":
        return kOrangeColor;
      default:
        return kBlueColor;
    }
  }
}
