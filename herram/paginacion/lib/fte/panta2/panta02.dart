import "package:flutter/material.dart";
import "package:paginacion/fte/panta1/panta01.dart";

class Panta02 extends StatelessWidget {
  static const String routeName = "/fte/panta1/pant02";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Multi Pantalla dos"),
        ),
        body: new FlatButton(
          child: const Text('Test Underlines'),
          color: Colors.red.shade800,
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, Panta01.routeName);
          },
        )
    );
  }
}
