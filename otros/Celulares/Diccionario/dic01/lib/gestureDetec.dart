import 'package:flutter/material.dart';

class miGesture extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage', textDirection: TextDirection.ltr,),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////
class MainGesture extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GestureDetector Example',
      theme: new ThemeData(
        primaryColor: const Color(0xFF43a047),
        accentColor: const Color(0xFFffcc00),
        primaryColorBrightness: Brightness.dark,
      ),
      home: new EjGesture(),
    );
  }
}
class EjGesture extends StatefulWidget {
  EjGesture({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();

}
class _HomePageState extends State<EjGesture> {

  @override
  Widget build(BuildContext context) {
    Widget redSection =
    new Container(
      color: Colors.red,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text("Launch Search"),
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: (){
              print('Se presiono el botón!');
            },
          ),
          new Text(
              "Tapping this text, the icon, or the title, will launch search"),
        ],
      ),
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gesture Detector Example"),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
        child: redSection,
      ),
    );
  }


}