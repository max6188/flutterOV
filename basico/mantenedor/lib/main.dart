import 'package:flutter/material.dart';
import 'package:mantenedor/pages/home.dart';
import 'package:mantenedor/pages/settings.dart';

void main() {
  runApp(new MaterialApp(
   home: Home(),
   routes: <String, WidgetBuilder>
   {
     Settings.routeName: (BuildContext context) => new Settings(),
     Huevona.routeName: (BuildContext context) => new Huevona(),
   }
  ));
}
