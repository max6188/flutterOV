import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';
import 'cabecera.dart';
import 'constantes.dart';




List<Positioned> lPos =   [
       new Positioned(
          left: 0.0,
          top: 0.0,
          child: Fila(),
        ),

         new Positioned(
          left: 0.0,
          top: 60.0,
          child: new Container(
            child: new Image.asset(
              'images/tablero.png',
              width: 400.0,
              height: 400.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Positioned(
          left: tLeft[0],
          top: tTop[0],
          child: Ficha(width:40.0,height:40.0),
        ),
        new Positioned(
          left: tLeft[1],
          top: tTop[1],
          child: Ficha(width:40.0,height:40.0),
        )
        ];
 

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Tablero(),
    );
}
}
class Tablero extends StatefulWidget {




  @override
  _Tablero createState() => _Tablero();
}

class _Tablero extends State<Tablero> {

 
  @override
  Widget build(BuildContext context) {
    String jugador = colorBlanco;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ajedrez'),
        backgroundColor: Colors.blue,
      ),
      body: new Stack(children: <Widget>[
        lPos[0],
        lPos[1]
      ]
    

       
      

  /*     
        new Positioned(
          left: 0.0,
          top: 0.0,
          child: (size: commonSize),
        ),
        new Positioned(
          left: 50.0,
          top: 0.0,
          child: BlackKnight(size: commonSize),
        ),
        new Positioned(
          left: 250.0,
          top: 0.0,
          child: BlackKing(size: commonSize),
        ),
        new Positioned(
          left: 0.0,
          top: 250.0,
          child: WhitePawn(size: commonSize),
        ),
        new Positioned(
          left: 0.0,
          top: 300.0,
          child: WhiteKing(size: commonSize),
        )
        */
      ),
      /*
        Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    WhitePawn(size: commonSize),
                    WhiteKnight(size: commonSize),
                    WhiteBishop(size: commonSize),
                    WhiteRook(size: commonSize),
                    WhiteQueen(size: commonSize),
                    WhiteKing(size: commonSize)
                  ],
                ),
                Row(
                  children: <Widget>[
                    BlackPawn(size: commonSize),
                    BlackKnight(size: commonSize),
                    BlackBishop(size: commonSize),
                    BlackRook(size: commonSize),
                    BlackQueen(size: commonSize),
                    BlackKing(size: commonSize)
                  ],
                ),
                Row(
                  children: <Widget>[
                    WhiteRook(position: Offset(20.0, 5.0), size: 60.0)
                  ],
                )
              ],   
            */
      // )
    );
  }
}
