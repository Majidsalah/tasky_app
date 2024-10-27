import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: textStyle12.copyWith(),
      ),
    );
  }
}
