import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';

// ignore: must_be_immutable
class DatePickerCalender extends StatefulWidget {
  DatePickerCalender({
    super.key,
    this.filled = false,
    required this.dueDate,
  });
  String? dueDate;
  DateTime? _selectedDate;
  final bool filled;
  @override
  State<DatePickerCalender> createState() => _DatePickerCalenderState();
}

class _DatePickerCalenderState extends State<DatePickerCalender> {
  String? endDate;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: widget.filled ? kSecondryColor : null,
            border:
                widget.filled ? null : Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            widget.filled
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End Date ', style: textStyle12),
                      Text(
                        widget.dueDate!,
                        style: textStyle14,
                      )
                    ],
                  )
                : Text(convertDate()),
            IconButton(
                onPressed: () {
                  widget.filled ? null : _showDatePicker();
                },
                icon: Icon(
                  IconlyBold.calendar,
                  color: kPrimaryColor,
                )),
          ]),
        ));
  }

  convertDate() {
    if (widget._selectedDate == null) {
      return 'Choose due date...';
    } else {
      endDate =
          '${widget._selectedDate!.day.toString()} / ${widget._selectedDate!.month.toString()} / ${widget._selectedDate!.year.toString()}';
      log(widget.dueDate.toString());

      return endDate;
    }
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        widget._selectedDate = value!;
      });
    });
  }
}
