import 'dart:async';

import 'package:api_prac_3/apiprac6/api_prac6.dart';
import "package:flutter/material.dart";


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Navigate to the next screen after a delay
    Timer(
      Duration(seconds: 3), // Change the duration as needed
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PrayerTimesScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/mosque.png"),
            SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "أوقات الصلاة",
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[500],
                  ),
                ),
              ],
            ),
            SizedBox(height: 130,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                      "Developed By:\nSyed Yousuf Hussain",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.brown[500],
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
