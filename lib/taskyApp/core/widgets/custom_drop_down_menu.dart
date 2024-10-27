import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends StatefulWidget {
  CustomDropDownButton(
      {super.key,
      required this.option1,
      required this.option2,
      required this.option3,
      this.prefixIcon = false,
      this.filled = false,
      this.onChanged,
      this.hintText,
      required this.value});
  final String option1;
  final String option2;
  final String option3;
  final String? value;
  String? hintText;
  bool filled;
  bool prefixIcon;
  final Function(String?)? onChanged;
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325,
      child: DropdownButtonFormField(
        icon: widget.filled
            ? Icon(IconlyBold.arrow_down_2, size: 20, color: kPrimaryColor)
            : const Icon(CupertinoIcons.chevron_down, size: 20),
        hint: widget.filled
            ? Text(
                "${widget.hintText}",
                style: textStyle16.copyWith(color: kPrimaryColor),
              )
            : const Text('Choose experience Level'),
        decoration: InputDecoration(
          prefix: widget.prefixIcon
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:
                      Icon(CupertinoIcons.flag, size: 20, color: kPrimaryColor))
              : null,
          filled: widget.filled,
          fillColor: widget.filled ? kSecondryColor : null,
          border: widget.filled
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
        ),
        value: widget.value,
        onChanged: widget.onChanged,
        items: <String>[widget.option1, widget.option2, widget.option3]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: widget.filled
                    ? textStyle16.copyWith(color: kPrimaryColor)
                    : null),
          );
        }).toList(),
      ),
    );
  }
}
