import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/features/auth/presentation/views/login_view.dart';
import 'package:task/features/auth/presentation/views/sign_up.dart';
import 'package:task/features/home/presentaion/views/add_task_view.dart';
import 'package:task/features/home/presentaion/views/task_details_view.dart';
import 'package:task/features/home/presentaion/views/tasks_home_view.dart';
import 'package:task/features/home/presentaion/views/user_profile_view.dart';
import 'package:task/features/splash/presentation/view/splash_view.dart';
import 'package:task/features/splash/presentation/view/welcome_view.dart';

abstract class AppRouter {
  static String kSplashView = '/';
  static String kLoginView = '/logIn';
  static String kSignUpview = '/signUp';
  static String kWelcomeView = '/welcome';
 static String khomeView = '/home';
  static String kTaskDetailsView = '/taskDetails';
  static String kAddTaskView = '/addTask';
    static String kProfile = '/profile';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (BuildContext context, GoRouterState state) {
          return const LogInView();
        },
      ),
      GoRoute(
        path: kSignUpview,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpView();
        },
      ),
      GoRoute(
        path: kWelcomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomScreen();
        },
      ),
        GoRoute(
        path: khomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const TasksHomeView();
        },
      ),
           GoRoute(
        path: kTaskDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return const TaskDetailsView();
        },
      ),
            GoRoute(
        path: kAddTaskView,
        builder: (BuildContext context, GoRouterState state) {
          return const AddTaskView();
        },
      ),
             GoRoute(
        path: kProfile,
        builder: (BuildContext context, GoRouterState state) {
          return const UserProfileView();
        },
      ),
    ],
  );
}
