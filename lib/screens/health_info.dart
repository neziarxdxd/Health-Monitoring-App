import 'package:flutter/material.dart';

class HealthInfo extends StatefulWidget {
  @override
  _HealthInfoState createState() => _HealthInfoState();
}

class _HealthInfoState extends State<HealthInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Health Info"),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "BMI",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ),
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Height: ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Weight: ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Gender: ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Age: ",
                                style: TextStyle(fontSize: 20),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: Text("Edit"),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
