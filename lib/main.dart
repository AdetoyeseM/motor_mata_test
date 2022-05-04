import 'package:flutter/material.dart';
import 'package:new_api_task/screens/splash_screen.dart';
import 'package:new_api_task/service_locator.dart';

void main() {
  serviceLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotorMata Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
 