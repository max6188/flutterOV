import 'package:flutter/material.dart';

class clasePrueba extends StatelessWidget {
  final Widget texto;
  final VoidCallback miBoton;

  clasePrueba(this.texto, this.miBoton);
  @override
  Widget build(BuildContext context) {
    double miTextScaleFactor = 15.0;
    return IconButton(
    icon: Icon(Icons.access_time),
    onPressed: miBoton

    );
  }



}

