import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/widgets/custom_app_button.dart';
import 'package:task/taskyApp/core/widgets/custom_drop_down_menu.dart';
import 'package:task/taskyApp/core/widgets/custom_text_field.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/add_image_widget.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/custom_app_bar.dart';
import 'package:task/taskyApp/features/home/presentaion/views/widgets/date_picker_calender.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'Add New Task'),
            const SizedBox(height: 24),
            const AddImageWidget(),
            const SizedBox(height: 16),
            Text('Task title', style: textStyle12),
            const SizedBox(height: 8),
            CustomTextField(
              labelText: 'Enter title here...',
              padding: 0,
            ),
            const SizedBox(height: 16),
            Text('Task Description ', style: textStyle12),
            const SizedBox(height: 8),
            CustomTextField(
              labelText: 'Enter description here...',
              minLines: 6,
              maxLines: 10,
              height: 180,
              padding: 0,
            ),
            const SizedBox(height: 16),
            Text('Priority ', style: textStyle12),
            const SizedBox(height: 8),
            CustomDropDownButton(
                option1: 'Medium Priority',
                option2: 'Low Priority',
                option3: 'Heigh Priority',
                filled: true,
                prefixIcon: true),
            const SizedBox(height: 16),
            Text('Due date ', style: textStyle12),
             const SizedBox(height: 8),
            DatePickerCalender(),
            const SizedBox(height: 24),
            CustomAppButton(
                child: Text(
                  'Add Task',
                  style: textStyle16.copyWith(color: Colors.white),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

