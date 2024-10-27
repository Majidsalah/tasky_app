import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/core/widgets/custom_app_button.dart';
import 'package:task/taskyApp/core/widgets/custom_drop_down_menu.dart';
import 'package:task/taskyApp/core/widgets/custom_text_field.dart';
import 'package:task/taskyApp/features/addTask/presentation/manager/cubit/add_task_cubit.dart';
import 'package:task/taskyApp/features/addTask/presentation/manager/cubit/add_task_state.dart';
import 'package:task/taskyApp/features/addTask/presentation/views/widgets/add_image_widget.dart';
import 'package:task/taskyApp/core/widgets/custom_app_bar.dart';
import 'package:task/taskyApp/features/addTask/presentation/views/widgets/date_picker_calender.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/success_widget.dart';

// ignore: must_be_immutable
class AddTaskViewBody extends StatefulWidget {
  AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskDesc = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? priority;
    String? dueDate = '';
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: 'Add New Task'),
                SizedBox(height: 24.h),
                AddImageWidget(),
                SizedBox(height: 16.h),
                Text('Task title', style: textStyle12),
                SizedBox(height: 8.h),
                CustomInputTextField(
                  labelText: 'Enter title here...',
                  controller: taskTitle,
                  validator: (val) =>
                      val!.isEmpty ? 'This field is required' : null,
                  padding: 0,
                ),
                SizedBox(height: 16.h),
                Text('Task Description ', style: textStyle12),
                SizedBox(height: 8.h),
                CustomInputTextField(
                  labelText: 'Enter description here...',
                  validator: (val) =>
                      val!.isEmpty ? 'This field is required' : null,
                  controller: taskDesc,
                  minLines: 6,
                  maxLines: 10,
                  padding: 0,
                ),
                SizedBox(height: 16.h),
                Text('Priority ', style: textStyle12),
                SizedBox(height: 8.h),
                CustomDropDownButton(
                  option1: 'Medium Priority',
                  option2: 'Low Priority',
                  option3: 'High Priority',
                  filled: true,
                  prefixIcon: true,
                  value: priority ?? 'High Priority',
                  onChanged: (String? newPriority) {
                    String p(String newPriority) {
                      String nP = newPriority.split(' ')[0];
                      return nP.toLowerCase();
                    }

                    priority = p(newPriority ?? 'High Priority');
                  },
                ),
                SizedBox(height: 16.h),
                Text('Due date ', style: textStyle12),
                SizedBox(height: 8.h),
                DatePickerCalender(
                  dueDate: dueDate,
                ),
                SizedBox(height: 24.h),
                BlocConsumer<AddTaskCubit, AddTaskState>(
                  listener: (context, state) {
                    if (state is AddTaskFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            MessageWidget(message: 'Failed to add the task ❌❌'),
                        backgroundColor: Color.fromARGB(255, 233, 31, 17),
                        behavior: SnackBarBehavior.fixed,
                      ));
                    } else if (state is AddTaskSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            MessageWidget(message: 'Task added Successfuly ✔️'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.fixed,
                      ));
                    }
                  },
                  builder: (context, state) {
                    return state is AddTaskLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomAppButton(
                            child: Text(
                              'Add Task',
                              style: textStyle16.copyWith(color: Colors.white),
                            ),
                            onPressed: () async {
                              log(dueDate.toString());
                              if (_formKey.currentState!.validate()) {
                                String? image = await ShPref.getImage();
                                await BlocProvider.of<AddTaskCubit>(context)
                                    .createNewTask(image, taskTitle.text,
                                        taskDesc.text, priority!);
                              }
                            });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
