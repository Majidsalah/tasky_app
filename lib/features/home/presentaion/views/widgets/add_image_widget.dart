import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/utiles/constanst.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        borderType: BorderType.RRect,
        strokeCap: StrokeCap.round,
        color: kPrimaryColor,
        dashPattern: const [1, 3],
        radius: const Radius.circular(12),
        strokeWidth: 1.2,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                color: kPrimaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                'Add Image',
                style: textStyle16.copyWith(color: kPrimaryColor),
              )
            ],
          ),
        ));
  }
}
