import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Container(
          child: ListView(
            children: [
              Text("Welcome to Health Monitoring Application",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
              Image.asset(
                "img/wallpaper.png",
                scale: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
