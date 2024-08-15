import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/widgets/phone_field.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      this.isPassword = false,
      this.isPhone = false,
      this.showEyeIcon = true,
      this.padding = 16,
      this.labelText,
      this.height = 55,
      this.minLines,
      this.maxLines,
      this.controller,
      this.keyboardType,
      this.validator});
  String? labelText;
  bool isPassword;
  bool showEyeIcon;
  bool isPhone;
  double? height;
  int? minLines;
  int? maxLines;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double padding;
  String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return !widget.isPhone
        ? SizedBox(
            height: widget.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.padding),
              child: widget.isPassword
                  ? TextFormField(
                    
                      validator: widget.validator,
                      keyboardType: widget.keyboardType,
                      controller: widget.controller,
                      textInputAction: TextInputAction.done,
                      obscureText: widget.isPassword,
                      decoration: InputDecoration(
                      
                          suffixIcon: passwordIconFunction(widget.showEyeIcon),
                          labelText: widget.labelText,
                          alignLabelWithHint: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: textStyle14,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(),
                          )),
                    )
                  : TextFormField(
                      minLines: widget.minLines,
                      maxLines: widget.maxLines,
                      keyboardType: widget.keyboardType,
                      controller: widget.controller,
                      validator: widget.validator,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        errorMaxLines:  widget.maxLines,
                        
                          labelText: widget.labelText,
                          alignLabelWithHint: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: textStyle14,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(),
                          )),
                    ),
            ),
          )
        : PhoneNumberField();
  }

  passwordIconFunction(bool seePassword) {
    return IconButton(
        onPressed: () {
          setState(() {
            seePassword = !seePassword;
          });
        },
        icon: seePassword
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined));
  }
}


