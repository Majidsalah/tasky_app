import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/widgets/custom_app_button.dart';
import 'package:task/taskyApp/core/widgets/custom_drop_down_menu.dart';
import 'package:task/taskyApp/core/widgets/custom_text_field.dart';
import 'package:task/taskyApp/core/widgets/phone_field.dart';
import 'package:task/taskyApp/features/auth/presentation/manager/signUp_cubit/sign_up_cubit.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/stacked_text.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/success_widget.dart';

// ignore: must_be_immutable
class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController displayName = TextEditingController();
  TextEditingController experienceYears = TextEditingController();
  TextEditingController address = TextEditingController();

  getExperiencYears(String experienceYears) {
    int parsedYears = int.parse(experienceYears);
    return parsedYears;
  }

  @override
  Widget build(BuildContext context) {
    String? level;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const StackedText(text: 'Sign Up'),
            CustomInputTextField(
              labelText: 'Name...',
              controller: displayName,
              validator: (val) =>
                  val!.isEmpty ? 'This field is required' : null,
            ),
            SizedBox(height: 16.h),
            PhoneNumberField(
              controller: phone,
            ),
            SizedBox(height: 16.h),
            CustomInputTextField(
              labelText: 'Years of experience...',
              controller: experienceYears,
              keyboardType: TextInputType.number,
              validator: (val) =>
                  val!.isEmpty ? 'This field is required' : null,
            ),
            SizedBox(height: 16.h),
            CustomDropDownButton(
              option1: 'junior',
              option2: 'senior',
              option3: 'fresh',
              value: level,
              onChanged: (String? newValue) {
                level = newValue;
              },
            ),
            SizedBox(height: 16.h),
            CustomInputTextField(
              labelText: 'Address...',
              controller: address,
              validator: (val) =>
                  val!.isEmpty ? 'This field is required' : null,
            ),
            SizedBox(height: 16.h),
            CustomInputTextField(
                labelText: 'Password...',
                isPassword: true,
                controller: password,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'This field is required';
                  } else if (val.length < 6) {
                    return 'Password length must be more than 6 ';
                  }
                  return null;
                }),
            SizedBox(height: 16.h),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: MessageWidget(message: state.errorMessage),
                    backgroundColor: const Color.fromARGB(255, 233, 31, 17),
                    behavior: SnackBarBehavior.floating,
                  ));
                } else if (state is SignUpSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: MessageWidget(message: 'Signed Up Successfuly'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
              builder: (context, state) {
                return state is SignUpLoadingState
                    ? const CircularProgressIndicator()
                    : CustomAppButton(
                        child: Text('Sign Up',
                            style: textStyle16.copyWith(color: Colors.white)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<SignUpCubit>(context).signUp(
                                phone.text,
                                password.text,
                                displayName.text,
                                getExperiencYears(experienceYears.text),
                                address.text,
                                level ??= 'fresh');
                          }
                        });
              },
            ),
            HaveAnAccountWidget(
                haveAccount: true, onPressed: () => GoRouter.of(context).pop())
          ],
        ),
      ),
    );
  }
}
