import 'package:flutter/material.dart';
import 'package:task/features/auth/presentation/views/widgets/login_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: LogInViewBody(),
      ),
    );
  }
}
