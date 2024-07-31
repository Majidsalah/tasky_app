import 'package:flutter/material.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/utiles/constanst.dart';

class ColoredStatusContainer extends StatelessWidget {
  const ColoredStatusContainer({
    super.key,
    this.status = 'Waiting',
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
    switch (status) {
      case "Waiting":
        return kLightOrangeColor;
      case "Finished":
        return kLightBlueColor;
      default:
        return kSecondryColor;
    }
  }

  getTextColor() {
    switch (status) {
      case "Waiting":
        return kOrangeColor;
      case "Finished":
        return kBlueColor;
      default:
        return kPrimaryColor;
    }
  }
}
