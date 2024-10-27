import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/core/widgets/custom_app_bar.dart';
import 'package:task/taskyApp/core/widgets/custom_drop_down_menu.dart';
import 'package:task/taskyApp/features/addTask/presentation/views/widgets/date_picker_calender.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';
import 'package:task/taskyApp/features/taskDetails/presentation/manager/cubit/edit_task_cubit.dart';
import '../../../../../core/functions/methods.dart';

// ignore: must_be_immutable
class TaskDetailsViewBody extends StatefulWidget {
  TaskDetailsViewBody({super.key, required this.task});
  final TasksModel task;
  bool isEditing = false;
  String? newLevel;
  String? newPriorty;
  @override
  State<TaskDetailsViewBody> createState() => _TaskDetailsViewBodyState();
}

class _TaskDetailsViewBodyState extends State<TaskDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    String? level = statusFun(widget.task.status!);
    String? priority = priorityFun(widget.task.priority!);
    TextEditingController titleController =
        TextEditingController(text: widget.task.title);
    TextEditingController descController =
        TextEditingController(text: widget.task.desc);
    return BlocProvider(
      create: (context) => EditTaskCubit(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Task Details',
                leadingIcon: true,
                task: widget.task,
                taskTitle: titleController.text,
                desc: descController.text,
                priority: widget.newPriorty,
                status: widget.newLevel,
              ),
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    fadeOutDuration: const Duration(seconds: 2),
                    fadeInDuration: const Duration(seconds: 2),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl:
                        "https://todo.iraqsapp.com/images/${widget.task.image}",
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              if (!widget.isEditing)
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isEditing = true;
                      });
                    },
                    child: Row(
                      children: [
                        Text(widget.task.title!, style: textStyle24),
                        SizedBox(width: 8.h),
                        Icon(Icons.edit, size: 16, color: kPrimaryColor)
                      ],
                    ))
              else
                TextFormField(
                  style: textStyle24,
                  controller: titleController,
                  onFieldSubmitted: (value) {
                    setState(() {
                      widget.task.title = value;
                      widget.isEditing = false;
                    });
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 202, 0, 0)),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(),
                      )),
                ),
              SizedBox(height: 8.h),
              if (!widget.isEditing)
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isEditing = true;
                      });
                    },
                    child: Text(
                      widget.task.desc!,
                      style: textStyle14,
                    ))
              else
                TextFormField(
                  maxLines: 5,
                  style: textStyle14,
                  controller: descController,
                  decoration: InputDecoration(
                      suffix: SizedBox(
                        width: 40,
                        height: 30,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                widget.task.desc = descController.text;
                                widget.isEditing = false;
                              });
                            },
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: kPrimaryColor),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                            )),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 202, 0, 0)),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(),
                      )),
                ),
              SizedBox(height: 8.h),
              DatePickerCalender(
                filled: true,
                dueDate: formatDate(widget.task.createdAt!),
              ),
              SizedBox(height: 8.h),
              CustomDropDownButton(
                hintText: level,
                option1: 'Inprogress',
                option2: 'Waiting',
                option3: 'Finished',
                filled: true,
                value: level,
                onChanged: (String? newValue) {
                  setState(() {
                    widget.newLevel = newValue;
                  });
                  log(level.toString());
                },
              ),
              SizedBox(height: 8.h),
              CustomDropDownButton(
                hintText: priority,
                option1: 'Medium Priority',
                option2: 'Low Priority',
                option3: 'High Priority',
                filled: true,
                prefixIcon: true,
                value: priority,
                onChanged: (String? newValue) {
                  setState(() {
                    widget.newPriorty = newValue;
                  });
                },
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }

  priorityFun(String pString) {
    if (pString.characters.first == 'l') {
      return 'Low Priority';
    } else if (pString.characters.first == 'm') {
      return 'Medium Priority';
    } else {
      return 'High Priority';
    }
  }

  String statusFun(String sString) {
    if (sString.characters.first == 'w') {
      return 'Waiting';
    } else if (sString.characters.first == 'i') {
      return 'Inprogress';
    } else {
      return 'Finished';
    }
  }
}
