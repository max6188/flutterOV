import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'PiolaModel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Chica{
    String _foto;
    String _nombre;
    int _estrellas;
    String _horario;


    Chica(this._foto, this._nombre, this._estrellas,this._horario);

    int get estrellas => _estrellas;

    String get nombre => _nombre;

    String get foto => _foto;

    String get horario=> _horario;


}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  static Widget  texto(String linea){

    return new Expanded(
      child: new Container(
        decoration: new BoxDecoration(
          color:Colors.green,
          border: new Border.all(width: 10.0, color: Colors.lightBlueAccent),
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        ),
        margin: const EdgeInsets.all(4.0),
        child: new Text(linea,
          style: new TextStyle(fontSize: 12.0,),
        ),
      ),
    );

  }
  static Container titulo (String linea){
    return  new Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: new Text(
        linea,
        style: new TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  static Container estrellas(int nE) {
    List<Icon> lista = new List();
    lista.length=0;
    for(int i=0;i<nE;i++){
      lista.add(   new Icon(Icons.star, color: Colors.blue));
    }

    return new Container(
    padding: new EdgeInsets.all(2.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Row(
          mainAxisSize: MainAxisSize.min,
          children: lista,
        ),
      ],
    ),
  );

}

  static List<Container> _listaChicas() {
    List<Chica> list =  [
      new Chica("imagenes/chica1.jpg","alejandra",0,"Desde las 17 horas"),

      new Chica("imagenes/chica2.jpg","Alicia",3,"Noches solamente"),
      new Chica("imagenes/chica3.PNG","Javiera",4,"Full"),
      new Chica("imagenes/chica4.jpg","Samanta",3,"almuerzos y onces"),
      new Chica("imagenes/chica5.jpg","Belen",4,""),
      new Chica("imagenes/chica6.png","Marcela",5,""),
      new Chica("imagenes/chica7.png","Laura",2,"")];

    List<Container> lista2 = new List();
    for (Chica c in list) {


      Widget w = new Card(
         child: new Row(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                new Container(
                    width: 160.0,
                    child: new Card(
                        child: new Column(
                          children:[
                            titulo(c.nombre),
                            new  Text(c.horario),
                            estrellas(c._estrellas),
                          ]
                        ),
                    ),
                 ),
                new Image.asset(
                  c.foto,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),

                new Divider(),
            ],
       ));

    lista2.add(new Container(child: w));
      }






     return lista2;
  }



  static Widget body(){
   return new Center(
      child: new ListView(
        children: _listaChicas(),
      ),
    );


  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navegación',
          onPressed: null,
        ),
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.mail),
            tooltip: 'Mail',
            onPressed: null,
          ),

          new IconButton(
          icon: new Icon(Icons.call),
          tooltip: 'Celular',
          onPressed: null,
          ),
        ],


      ),

      body: body(), ///////////---->aca cuerpo

      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Buscar',
        child: new Icon(Icons.find_in_page),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
