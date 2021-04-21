import 'package:flutter/material.dart';

class WalangLaman extends StatefulWidget {
  @override
  _WalangLamanState createState() => _WalangLamanState();
}

class _WalangLamanState extends State<WalangLaman> {
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
              "Empty",
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
