import "package:flutter/material.dart";
import "package:paginacion/fte/panta2/panta02.dart";

class Panta01 extends StatelessWidget {
  static const String routeName = "/fte/panta1/panta01";
  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Multi Pantalla uno"),
      ),
      body: new FlatButton(
        child: const Text('Test Underlines'),
        color: Colors.red.shade800,
        textColor: Colors.white,
        onPressed: () { Navigator.pushNamed(context,Panta02.routeName); },
      )
    );
  }
}