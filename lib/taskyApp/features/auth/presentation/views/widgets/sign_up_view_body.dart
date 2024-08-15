import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/widgets/custom_app_button.dart';
import 'package:task/taskyApp/core/widgets/custom_drop_down_menu.dart';
import 'package:task/taskyApp/core/widgets/custom_error_widget.dart';
import 'package:task/taskyApp/core/widgets/custom_text_field.dart';
import 'package:task/taskyApp/features/auth/presentation/manager/sign_up_cubit/cubit/sign_up_cubit.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/stacked_text.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var controller = BlocProvider.of<SignUpCubit>(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const StackedText(text: 'Sign Up'),
            CustomTextField(
              labelText: 'Name...',
              controller: controller.displayName,
              validator: (val) =>
                  val!.isEmpty ? 'This field is required' : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Phone...',
              isPhone: true,
              controller: controller.phone,
              validator: (val) {
                    return    val!.isEmpty ? 'This field is required' : null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Years of experience...',
              controller: controller.experienceYears,
              keyboardType: TextInputType.number,
              validator: (val) =>
                  val!.isEmpty ? 'This field is required' : null,
            ),
            const SizedBox(height: 16),
            CustomDropDownButton(
                option1: 'junior', option2: 'senior', option3: 'fresh'),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Address...',
              controller: controller.address,
              validator: (val) =>
                  val!.isEmpty ? 'This field is required' : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
                labelText: 'Password...',
                isPassword: true,
                controller: controller.password,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'This field is required';
                  } else if (val.length < 6) {
                    return 'Password length must be more than 6 ';
                  }
                  return null;
                }),
            const SizedBox(height: 16),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                if (state is SignUpSuccessState) {
                  return const Center(child: Text('signed up successfully'));
                } else if (state is SignUpFailed) {
                  return CustomErrorMessage(errorMessage: state.errorMessage);
                } else {
                  return CustomAppButton(
                      child: Text('Sign Up',
                          style: textStyle16.copyWith(color: Colors.white)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context).signUp();
                        }
                      });
                }
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
