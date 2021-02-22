import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthmonitor/helpers/drawer_navigation.dart';
import 'package:healthmonitor/models/todo.dart';
import 'package:healthmonitor/screens/todo_screen.dart';
import 'package:healthmonitor/services/todo_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoService _todoService;

  List<Todo> _todoList = List<Todo>();
  FlutterLocalNotificationsPlugin fltrNotification;
  @override
  initState() {
    super.initState();
    getAllTodos();
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
        new InitializationSettings(android: androidInitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max);
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails);
    await fltrNotification.show(
        0, "Task", "You created a Task", generalNotificationDetails,
        payload: "Task");
  }

  Future notificationSelected(String payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Notification : $payload"),
      ),
    );
  }

  getAllTodos() async {
    _todoService = TodoService();
    _todoList = List<Todo>();

    var todos = await _todoService.readTodos();

    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.description = todo['description'];
        model.category = todo['category'];
        model.todoDate = todo['todoDate'];
        model.isFinished = todo['isFinished'];
        _todoList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Health monitoring App'),
      ),
      drawer: DrawerNavigaton(),
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
              child: Container(
                height: 100,
                child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child: ListTile(
                      title: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          _todoList[index].title ?? 'No Title',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      subtitle: Text(
                        _todoList[index].category ?? 'No Category',
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          _todoList[index].todoDate ?? 'No Date',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TodoScreen())),
        child: Icon(Icons.add),
      ),
    );
  }
}
