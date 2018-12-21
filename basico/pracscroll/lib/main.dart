import 'package:flutter/material.dart';
import 'package:pracscroll/tabbar/tabita.dart';
import 'package:pracscroll/colapso.dart';
import 'package:pracscroll/hero/heromain.dart';


final ThemeData maxSoftTheme = new ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.lightBlue[800],
  accentColor: Colors.cyan[600],
  textTheme: new TextTheme(
    body1: new TextStyle(color: Colors.blue,fontSize: 15.0,
        fontWeight: FontWeight.bold),
    subhead:new TextStyle(color:Colors.green),
  ),
  dialogBackgroundColor:Colors.red,
);

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Practico Scrool',
    theme:maxSoftTheme,
    home: new PracScroll(),
  ));
}



class PracScroll extends StatefulWidget {
   @override
   _PracScroll createState() => new _PracScroll();
}
  class _PracScroll extends State<PracScroll> {

    void boton(Widget page) {
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => page));
    }
    Widget build(BuildContext context) {
      void initState() {
        super.initState();
      }
      return new Scaffold(
          appBar: new AppBar(
          title: new Center(child: Text('PracScroll')), //el título
        ),
      body: new Center(
        child: new ListView(
          children: [
              MiMenu(title: "Manejo del tab",
              boton: () {
               boton(Tabita());
          }),
            MiMenu(title: "Colapso",
                  boton: () {
                    boton(Colapso());
                  }),
              MiMenu(title: "Hero",
                  boton: () {
                    boton(HeroMain());
                  }),

          ],
         ),
        ),
        floatingActionButton: new FloatingActionButton(
          tooltip: 'Agregar',
          child: new Icon(Icons.add),
          onPressed:(){

          },
        ),
      );
    }
}

class MiMenu extends StatelessWidget {
  final String title;
  final VoidCallback boton;

  MiMenu({this.title, this.boton});
  @override
  Widget build(BuildContext context) {
    return new Padding(padding: const EdgeInsets.all(10.0),
    child: MaterialButton(
      height: 30.0,
      child: new Text(title,
        style:DefaultTextStyle.of(context).style.apply(
          fontSizeFactor: 1.5,
          color: Colors.green[800],
          decoration: TextDecoration.none,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy,
        ),
      ),
      onPressed: boton
    ));
  }
}

