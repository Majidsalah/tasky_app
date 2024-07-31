import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task/core/utiles/app_text_styles.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      this.isPassword = false,
      this.isPhone = false,
      this.showEyeIcon = true,
       this.padding=16,
      this.labelText,
      this.height = 55,
      this.minLines,
      this.maxLines,
      this.controller,
      this.keyboardType});
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
              padding:  EdgeInsets.symmetric(horizontal: widget.padding),
              child: widget.isPassword
                  ? TextFormField(
                      keyboardType: widget.keyboardType,
                      controller: widget.controller,
                      textInputAction: TextInputAction.done,
                      obscureText: widget.isPassword,
                      decoration: InputDecoration(
                          suffixIcon: widget.isPassword
                              ? passwordIconFunction(widget.showEyeIcon)
                              : null,
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
                      textInputAction: TextInputAction.done,
                      obscureText: widget.isPassword,
                      decoration: InputDecoration(
                          suffixIcon: widget.isPassword
                              ? passwordIconFunction(widget.showEyeIcon)
                              : null,
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
        : const PhoneNumberField();
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

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntlPhoneField(
        disableLengthCheck: true,
        dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined),
        dropdownIconPosition: IconPosition.trailing,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          labelStyle: textStyle14,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'EG',
        onChanged: (phone) {},
      ),
    );
  }
}
