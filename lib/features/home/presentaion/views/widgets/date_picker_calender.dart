import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/utiles/constanst.dart';

// ignore: must_be_immutable
class DatePickerCalender extends StatefulWidget {
  DatePickerCalender({
    super.key,
    this.filled = false,
  });
  DateTime? datetime;
  final bool filled;

  @override
  State<DatePickerCalender> createState() => _DatePickerCalenderState();
}

class _DatePickerCalenderState extends State<DatePickerCalender> {
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
                        '30 June, 2022',
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
    if (widget.datetime == null) {
      return 'Choose due date...';
    } else {
      return '${widget.datetime!.day.toString()} / ${widget.datetime!.month.toString()} / ${widget.datetime!.year.toString()}';
    }
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        widget.datetime = value!;
      });
    });
  }
}
