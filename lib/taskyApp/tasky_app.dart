import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/taskyApp/core/utiles/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: ThemeData(textTheme: GoogleFonts.dmSansTextTheme()),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
