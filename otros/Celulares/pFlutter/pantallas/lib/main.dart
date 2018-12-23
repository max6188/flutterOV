import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new PrimeraPantalla(),
  ));
}

class PrimeraPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          tooltip: 'Navigation menu',
          icon: new Icon(Icons.menu),
          onPressed: null,
        ),
        title: new Text('Routes'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.mail_outline),
            tooltip: 'Correo',
            onPressed:() {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new PantaMail()),
              );
            },
          ),
        ],
      ),
      // body is the majority of the screen.
      body: new Center(
        child: new Text('Hello, world!'), //el texto centrado
      ),
      floatingActionButton: new FloatingActionButton( //el botón flotante
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new PantaAnexa()),
          );
        },
      ),
    );
  }
}

class PantaMail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: new Text(
              'Solo un texto',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          new Center(
            child: new RaisedButton(
              onPressed: () {
                Navigator.pop(context);
                 Navigator.pop(context); 
              },                         
              child: new Text('Volver al principal!'),
            ),
          ),
        ]
    );
  }
}

class PantaAnexa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(onPressed: (){
         Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new PantaMail()),
         );


      })
    );
  }
}