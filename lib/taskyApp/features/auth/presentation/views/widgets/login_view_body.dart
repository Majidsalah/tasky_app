import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/go_router.dart';
import 'package:task/taskyApp/core/widgets/custom_app_button.dart';
import 'package:task/taskyApp/core/widgets/app_Image.dart';
import 'package:task/taskyApp/core/widgets/custom_text_field.dart';
import 'package:task/taskyApp/core/widgets/phone_field.dart';
import 'package:task/taskyApp/features/auth/presentation/manager/login_cubit/log_in_cubit.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/success_widget.dart';

class LogInViewBody extends StatelessWidget {
  LogInViewBody({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppImage(),
            const CustomText(text: "Login"),
            PhoneNumberField(
              controller: phone,
            ),
            SizedBox(height: 16.h),
            CustomInputTextField(
              controller: password,
              labelText: 'Password...',
              isPassword: true,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'This field is required';
                } else if (val.length < 6) {
                  return 'Password length must be more than 6 ';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            BlocConsumer<LogInCubit, LogInState>(
              listener: (context, state) {
                if (state is LogInFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: MessageWidget(message: state.errorMessage),
                    backgroundColor: const Color.fromARGB(255, 233, 31, 17),
                    behavior: SnackBarBehavior.floating,
                  ));
                } else if (state is LogInSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: MessageWidget(message: 'Loged In Successfuly'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ));
                  Future.delayed(const Duration(seconds: 2), () {
                    GoRouter.of(context).pushReplacement(AppRouter.khomeView);
                  });
                }
              },
              builder: (context, state) {
                return state is LogInLoadingState
                    ? const CircularProgressIndicator()
                    : CustomAppButton(
                        child: Text('Sign In',
                            style: textStyle16.copyWith(color: Colors.white)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await BlocProvider.of<LogInCubit>(context)
                                .logIn(phone.text, password.text);
                            log(phone.text);
                          }
                        });
              },
            ),
            HaveAnAccountWidget(
              haveAccount: false,
              onPressed: () => GoRouter.of(context).push(AppRouter.kSignUpview),
            )
          ],
        ),
      ),
    );
  }
}
