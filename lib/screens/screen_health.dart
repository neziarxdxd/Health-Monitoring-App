import 'package:flutter/material.dart';

class ScreenHealth extends StatefulWidget {
  @override
  _ScreenHealthState createState() => _ScreenHealthState();
}

class _ScreenHealthState extends State<ScreenHealth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Staying Healthy Year-Round",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text("Weekly Health Tips",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            SizedBox(
              height: 30,
            ),
            WidgetCard(
              imageSource: "img/img1.jpg",
              leadingTitle: "1",
              title: "Get active",
              information:
                  "The activity you partake in doesn’t have to be strenuous. Low impact exercises are effective",
            ),
            WidgetCard(
              imageSource: "img/img2.jpg",
              information:
                  "You might consider biking, walking, swimming, or low impact aerobics. Modify your exercise routine to find what feels best for you.",
              title: "Excercise that's good for you",
              leadingTitle: "2",
            ),
            WidgetCard(
              imageSource: "img/img3.jpg",
              title: "Take supplements",
              information:
                  "Before taking a supplement, always ask your doctor if it’s safe, especially if you’re taking a prescription medication. Some supplements they may recommend include calcium, vitamin D, vitamin B6, or vitamin B12",
              leadingTitle: "3",
            ),
            WidgetCard(
              imageSource: "img/img4.jpg",
              title: "Eat a healthy diet",
              information:
                  "Diets rich in fruits, vegetables, and lean meats also give your immune system a boost and protect against harmful viruses and bacteria that cause illnesses",
              leadingTitle: "4",
            )
          ],
        ),
      )),
    );
  }
}

class WidgetCard extends StatefulWidget {
  final String title;
  final String information;
  final String leadingTitle;
  final String imageSource;

  const WidgetCard(
      {Key key,
      this.title,
      this.information,
      this.leadingTitle,
      this.imageSource = "img/img1.jpg"})
      : super(key: key);

  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          new AspectRatio(
              aspectRatio: 500 / 250,
              child: new Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.topCenter,
                  image: new AssetImage(widget.imageSource),
                )),
              )),
          ListTile(
            leading: Text(widget.leadingTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            title: Text(widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            subtitle: Text(widget.information,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
            trailing: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
