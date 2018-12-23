import 'package:flutter/material.dart';

import "formulario2.dart";


void main() {
  runApp(new MaterialApp(
    title: 'Text tester',
    home: PPrincipal(),
    routes: <String, WidgetBuilder>{
      'agUsuario': (BuildContext context) => PLoginPage2(),

    },
  ));
}

class PPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Formulario de Ingreso'),

      ),
      // body is the majority of the screen.
      body: new Center(
        child: new Text('Ingrese el formulario!'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Agregar Usuario',
        child: new Icon(Icons.add),
        onPressed: () { Navigator.pushNamed(context, 'agUsuario'); },
      ),
    );
  }
}
