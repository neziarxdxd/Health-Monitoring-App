import 'package:flutter/material.dart';
import 'package:healthmonitor/src/app.dart';

import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new App(),
      title: Text("Welcome to Health Monitoring Application",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      image: Image.asset(
        "img/wallpaper.png",
        height: 100,
        width: 100,
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.green,
    );
  }
}
