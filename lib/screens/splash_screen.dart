import 'package:flutter/material.dart';
import 'package:new_api_task/screens/dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    Future.delayed(
        const Duration(seconds: 5),
        () async => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Dashboard()))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                "assets/images/news.jpg",
                width: 145,
                height: 145,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
