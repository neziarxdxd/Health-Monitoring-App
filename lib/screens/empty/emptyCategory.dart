import 'package:flutter/material.dart';

class EmptyTask extends StatefulWidget {
  @override
  _EmptyTaskState createState() => _EmptyTaskState();
}

class _EmptyTaskState extends State<EmptyTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            Image.asset(
              "img/empty-1.png",
              scale: 3,
            ),
            Center(
                child: Text(
              "Add Category by pressing the plus button",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ))
          ],
        ),
      ),
    );
  }
}
