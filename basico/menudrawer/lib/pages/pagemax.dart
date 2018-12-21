import 'package:flutter/material.dart';

class PageMax extends StatelessWidget {
  static const String routeName = "/maxPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Maxito")
      ),
      body: new Container(
          child: new Center(
              child: new Text("La mejor pantalla")
          )
      ),

    );
  }
}