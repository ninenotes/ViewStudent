import 'package:flutter/material.dart';
import 'package:viewstudent/states/app_service_student.dart';
import 'package:viewstudent/states/login.dart';

final Map<String, WidgetBuilder> map = {
  '/login': (context) => const Login(),
  '/appService': (context) => const AppServiceStudent(),
};
String? keyState;

void main() {
  keyState = '/login';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: keyState,
    );
  }
}
