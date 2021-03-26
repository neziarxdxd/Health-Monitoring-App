import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthmonitor/models/bmi.dart';
import 'package:healthmonitor/services/bmi_service.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  var weightTextControl = TextEditingController();
  var heightTextControl = TextEditingController();
  var ageTextControl = TextEditingController();
  var gender = TextEditingController();

  @override
  String dropdownValue = 'Male';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("BMI Calculator "),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      controller: weightTextControl,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight',
                        hintText: 'Write Weight in Kilogram',
                      )),
                  TextField(
                      controller: heightTextControl,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height',
                        hintText: 'Write Height in Centimeter',
                      )),
                  TextField(
                      controller: ageTextControl,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.account_circle),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 3,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Male', 'Female', 'LGBT']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  FlatButton(
                    child: Text("Save Info"),
                    onPressed: () async {
                      var bmiObject = BMI();
                      bmiObject.age = int.parse(ageTextControl.text);
                      bmiObject.weight = int.parse(weightTextControl.text);
                      bmiObject.height = int.parse(heightTextControl.text);
                      bmiObject.gender = dropdownValue;

                      var bmiService = BMIService();
                      var result = await bmiService.saveBMI(bmiObject);
                      print(result);
                    },
                    color: Colors.yellow,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
