import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task/taskyApp/features/auth/presentation/manager/sign_up_cubit/cubit/sign_up_cubit.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child:  SafeArea(
        child: Scaffold(
          body: SignUpViewBody(),
        ),
      ),
    );
  }
}
