import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';

// ignore: must_be_immutable
class CustomInputTextField extends StatefulWidget {
  CustomInputTextField(
      {super.key,
      this.isPassword = false,
      this.padding = 16,
      this.labelText,
      this.minLines,
      this.maxLines,
      this.controller,
      this.keyboardType,
      this.validator});
  String? labelText;
  bool isPassword;

  int? minLines;
  int? maxLines;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double padding;
  String? Function(String?)? validator;
  @override
  State<CustomInputTextField> createState() => _CustomInputTextFieldState();
}

class _CustomInputTextFieldState extends State<CustomInputTextField> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.padding),
          child: widget.isPassword
              ? TextFormField(
                  onEditingComplete: () {
                    return FocusScope.of(context).unfocus();
                  },
                  validator: widget.validator,
                  keyboardType: widget.keyboardType,
                  controller: widget.controller,
                  textInputAction: TextInputAction.done,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                      suffixIcon: passwordIconFunction(),
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
                  onEditingComplete: () {
                    return FocusScope.of(context).unfocus();
                  },
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  keyboardType: widget.keyboardType,
                  controller: widget.controller,
                  validator: widget.validator,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 202, 0, 0)),
                      ),
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
      ],
    );
  }

  passwordIconFunction() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        icon: _isPasswordVisible
            ? const Icon(Icons.visibility_outlined)
            : const Icon(Icons.visibility_off_outlined));
  }
}
