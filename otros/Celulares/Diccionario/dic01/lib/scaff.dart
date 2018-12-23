

import 'package:flutter/material.dart';


class Scaff01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton( //primer circulo
          icon: new Icon(Icons.menu),
          tooltip: 'Menú de navegación',
          onPressed: null,
        ),
        title: new Text('Scaff->Scaf01'), //el título
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Búsqueda',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: new Center(
        child: new Text('Bienvenido al diccionario!'), //el texto centrado
      ),
      floatingActionButton: new FloatingActionButton( //el botón flotante
        tooltip: 'Agregar', // used by assistive technologies
          
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class Scaff03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new BottomAppBar(
        color: Colors.white,
        child: bottomAppBarContents(),
    ),
      floatingActionButton: new FloatingActionButton(onPressed: null),
    );
  }
}

Widget bottomAppBarContents(){
  return new IconButton(
    icon: new Icon(Icons.search),
    tooltip: 'Búsqueda',
    onPressed: null,
  );
}

////////////////////////////////////////////////////////////////////////////////

class PruebaDrawer extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new Center(child: new Text('My Page!')),
      drawer: new Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: new ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Text('Drawer Header'),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title: new Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////
class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SnackBar Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('SnackBar Demo'),
        ),
        body: new SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        onPressed: () {
          final snackBar = new SnackBar(
            content: new Text('Mensaje que se desea desea mostrar!'),
            action: new SnackBarAction(
              label: 'Accion',
              onPressed: () {
                // Some code to undo the change!
              },
            ),
          );

          // Find the Scaffold in the Widget tree and use it to show a SnackBar!
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: new Text('Show SnackBar'),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////
class SnackBarDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SnackBar Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Snack bar"),
        ),
        body: new ListView.builder(
          itemCount: 42,
          itemBuilder: (context, index) {
            return new Card(
              child: new Column(
                children: <Widget>[
                  new Image.network(
                      "https://image.freepik.com/free-vector/unicorn-background-design_1324-79.jpg"),
                  new ListTile(
                    title: new Text("Wow"),
                    subtitle: new Text("That's a cool unicorn out there"),
                    trailing: new IconButton(
                      icon: const Icon(Icons.star),
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(
                          new SnackBar(
                            content: new Text("Added to favorite"),
                            action: new SnackBarAction(
                              label: "UNDO",
                              onPressed: () =>
                                  Scaffold.of(context).hideCurrentSnackBar(),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
