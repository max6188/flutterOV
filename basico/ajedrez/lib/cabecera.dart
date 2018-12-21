import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter/material.dart';
import "constantes.dart";



class Fila extends StatefulWidget {


  const Fila({Key key}): super(key: key);

  @override
  _Fila createState() => _Fila();
}

class _Fila extends State<Fila> {

  @override
  Widget build(BuildContext context) {
    return new Row(
        children: <Widget>[
           Cuadro(elColor: colorBlanco,col: 0,),
           Cuadro(elColor: colorNegro,col: 1,),
           Cuadro(elColor: colorBlanco,col: 2,),
           Cuadro(elColor: colorNegro,col: 3,),
           Cuadro(elColor: colorBlanco,col: 4,),
           Cuadro(elColor: colorNegro,col: 5,),
           Cuadro(elColor: colorBlanco,col: 6,),
           Cuadro(elColor: colorNegro,col:7,)


        ],
    );
    
    }
    
  }


class Cuadro extends StatefulWidget {
 final String elColor;
    final int col;

    Cuadro({this.elColor,this.col}) ;


  @override
  _Cuadro createState() => _Cuadro();
}

class _Cuadro extends State<Cuadro> {

   
   

    @override
    Widget build(BuildContext context) {
        return IconButton(
          onPressed: (){
        
          },
          icon: Image.asset(
                  'images/${widget.elColor}.png',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                )
            
        );}
}



class Ficha extends StatelessWidget {
  final double width;
  final double height;

Ficha({this.width,this.height});
@override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      width: width,
      height: height,
      child: WhitePawn(size: commonSize),
    );
  }
}

