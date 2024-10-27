import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/taskyApp/features/auth/presentation/manager/login_cubit/log_in_cubit.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/login_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => LogInCubit(),
        child: Scaffold(
          body: LogInViewBody(),
        ),
      ),
    );
  }
}
