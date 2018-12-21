import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(
      home: new Scaffold(
            appBar: new AppBar(
               title: new Text("Degradación"),
            ),

          body: new Container(
              child: new Center(
                child: new Text(
                  "Hola chic@s!",
                  style: new TextStyle(color: Colors.white),
                ),
              ),
              // Set background
              decoration: new BoxDecoration(
                  // Add Gradient
                  gradient: new LinearGradient(
                     colors: [Colors.blue, Colors.red],
                     begin: const FractionalOffset(0.0, 0.0),
                     end: const FractionalOffset(0.6, 1.0),
                     stops: [0.0, 1.0],
                     tileMode: TileMode.clamp)
  )))));
}
