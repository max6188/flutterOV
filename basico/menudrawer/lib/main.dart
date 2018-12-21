import 'package:flutter/material.dart';
import 'package:menudrawer/pages/home.dart';
import 'package:menudrawer/pages/settings.dart';
import 'package:menudrawer/pages/battery.dart';
import 'package:menudrawer/pages/pagemax.dart';


void main() {
  runApp(new MaterialApp(
   home: Home(),
   routes: <String, WidgetBuilder>
   {
     Settings.routeName: (BuildContext context) => new Settings(),
     Battery.routeName: (BuildContext context) => new Battery(),
     PageMax.routeName: (BuildContext context) => new PageMax(),

   }
  ));
}
