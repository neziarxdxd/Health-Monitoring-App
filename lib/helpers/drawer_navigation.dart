import 'package:flutter/material.dart';
import 'package:healthmonitor/models/todo.dart';
import 'package:healthmonitor/screens/categories_screen.dart';
import 'package:healthmonitor/screens/home_screen.dart';
import 'package:healthmonitor/screens/screen_health.dart';
import 'package:healthmonitor/screens/todos_by_category.dart';
import 'package:healthmonitor/screens/heart_pulse_screen.dart';
import 'package:healthmonitor/screens/health_info.dart';
import 'package:healthmonitor/services/category_service.dart';
import 'package:healthmonitor/services/todo_service.dart';

class DrawerNavigaton extends StatefulWidget {
  @override
  _DrawerNavigatonState createState() => _DrawerNavigatonState();
}

class _DrawerNavigatonState extends State<DrawerNavigaton> {
  List<Widget> _todoLissst = List<Widget>();

  TodoService _todoService = TodoService();

  @override
  initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _todoService.readTodos();

    categories.forEach((category) {
      setState(() {
        _todoLissst.add(InkWell(
          child: ListTile(
            title: Text(category['title'], style: TextStyle(fontSize: 15)),
          ),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Health Monitoring app',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              decoration: BoxDecoration(color: Colors.green),
              accountEmail: null,
            ),
            ListTile(
              leading: Icon(
                Icons.view_list,
                size: 30,
              ),
              title: Text('Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CategoriesScreen())),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text('Home',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen())),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                size: 30,
              ),
              title: Text('Heart Pulse',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HeartPulse())),
            ),
            ListTile(
              leading: Icon(
                Icons.ad_units_rounded,
                size: 30,
              ),
              title: Text('Health Tips',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ScreenHealth())),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Maintenance Medicine",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: _todoLissst,
            ),
          ],
        ),
      ),
    );
  }
}
