import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';

class ColoredStatusContainer extends StatelessWidget {
  const ColoredStatusContainer({
    super.key,
    required this.status,
  });
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 22,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
            color: getContainerColor(), borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(status,
              style: textStyle12.copyWith(
                  color: getTextColor(), fontWeight: FontWeight.bold)),
        ));
  }

  getContainerColor() {
    switch (status.characters.first) {
      case "w" || 'W':
        return kLightOrangeColor;
      case "f" || 'F':
        return kLightBlueColor;
      default:
        return kSecondryColor;
    }
  }

  getTextColor() {
    switch (status.characters.first) {
      case "w" || 'W':
        return kOrangeColor;
      case "f" || 'F':
        return kBlueColor;
      default:
        return kPrimaryColor;
    }
  }
}
