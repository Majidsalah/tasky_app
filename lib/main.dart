import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/tasky_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await ShPref.init();
  runApp(const MyApp());
}
