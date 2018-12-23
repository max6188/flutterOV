import 'package:flutter/material.dart';
import 'package:mirubber/default.dart';
import 'package:mirubber/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: HomePage(title: "Home",),
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title,style: TextStyle(color: Colors.cyan[900]),),
        ),
        body: ListView(
          children: <Widget>[
            RaisedButton(
              child: Text("Default"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DefaultPage()),
                );
              },
            ),
            RaisedButton(
              child: Text("Menu"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
            ),
          ],
        ),
    );
  }
}