import 'package:flutter/material.dart';

class EmptyCategory extends StatefulWidget {
  @override
  _EmptyCategoryState createState() => _EmptyCategoryState();
}

class _EmptyCategoryState extends State<EmptyCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            Image.asset(
              "img/empty-2.png",
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
