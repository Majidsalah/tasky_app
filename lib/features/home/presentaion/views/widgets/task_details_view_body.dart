import 'package:flutter/material.dart';
import 'package:task/core/utiles/app_text_styles.dart';
import 'package:task/core/widgets/custom_drop_down_menu.dart';
import 'package:task/features/home/presentaion/views/widgets/custom_app_bar.dart';
import 'package:task/features/home/presentaion/views/widgets/date_picker_calender.dart';

class TaskDetailsViewBody extends StatelessWidget {
  const TaskDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'Task Details', leadingIcon: true),
            Image.asset('assets/ima.png'),
            Text(
              "Grocery Shopping App",
              style: textStyle24,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 160,
              child: Text(
                  'This application is designed for super shops. By\nusing\nthis application they can enlist all their products in one\nplace and can deliver. Customers will get a one-\nstop solution for their daily shopping.',
                  style: textStyle14),
            ),
            DatePickerCalender(filled: true),
            const SizedBox(height: 8),
            CustomDropDownButton(
              option1: 'Inprogress',
              option2: 'Waiting',
              option3: 'Finished',
              filled: true,
            ),
            const SizedBox(height: 8),
            CustomDropDownButton(
              option1: 'Medium Priority',
              option2: 'Low Priority',
              option3: 'Heigh Priority',
              filled: true,
              prefixIcon: true,
            ),
            const SizedBox(height: 8),
            SizedBox(
                height: 326, width: 326, child: Image.asset('assets/code.png')),
          ],
        ),
      ),
    );
  }
}
