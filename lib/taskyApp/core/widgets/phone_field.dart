import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    String _intialCountryCode = 'EG';
    var _country =
        countries.firstWhere((element) => element.code == _intialCountryCode);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntlPhoneField(
        controller: widget.controller,
        disableLengthCheck: true,
        dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined),
        dropdownIconPosition: IconPosition.trailing,
        decoration: InputDecoration(
          errorText: isValid ? null : 'invalid phone number',
          labelText: 'Phone Number',
          labelStyle: textStyle14,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: _intialCountryCode,
        onSubmitted: (phone) {
          setState(() {
            widget.controller.text = phone;
          });
        },
        onChanged: (value) {
          if (value.completeNumber.isNotEmpty &&
              value.number.length >= _country.minLength &&
              value.number.length <= _country.maxLength + 1) {
            setState(() {
              isValid = true;
            });
          } else {
            setState(() {
              isValid = false;
            });
          }
        },
      ),
    );
  }
}
