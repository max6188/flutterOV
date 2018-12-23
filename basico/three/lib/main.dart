import 'package:flutter/material.dart';
import 'package:three/three_row_tile.dart'

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ThreeRowTile(
        icon: Icon(Icons.person),
        title: _contacts?.items[index]?.lastName.toString().isEmpty &&
            _contacts?.items[index]?.firstName.toString().isEmpty
            ? null
            : Text(
          (_contacts?.items[index]?.lastName ?? "") +
              ", " +
              (_contacts?.items[index]?.firstName ?? ""),
          textScaleFactor: globals.textScaleFactor,
        ),
        detail: Text(
          _contacts?.items[index]?.lastActivity,
          textScaleFactor: globals.textScaleFactor,
        ),
        utility1: _contacts?.items[index]?.dateCreated,
        utility1Help: 'Date Created',
        utility2: _contacts?.items[index]?.dateModified,
        utility2Help: "Date Modified",
        cell: _contacts?.items[index]?.cell,
        home: _contacts?.items[index]?.home,
        office: _contacts?.items[index]?.office,
        email: _contacts?.items[index]?.email,
        cellTapped: () {
          globals.contactID = _contacts?.items[index]?.contactID;
          Navigator.of(context).pushNamed("/contact_details").then((value) {
            if (globals.infoChanged) {
              _getData("", false).then((newitems) {
                setState(() {
                  _contacts = newitems;
                });
              });
            }
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


