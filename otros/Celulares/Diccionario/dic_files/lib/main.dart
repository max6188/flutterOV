

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import "contador.dart";
import "operaciones.dart";

enum PROCESO {FILE_CONTADOR,
              FILE_GRABADOR,
}


void main() {

  PROCESO p=PROCESO.FILE_GRABADOR;
  switch(p) {
    case PROCESO.FILE_CONTADOR:
      runApp(
        new MaterialApp(
          title: 'Reading and Writing Files',
          home: new FlutterDemo(storage: new CounterStorage()),
        ),
      );
      break;
    case PROCESO.FILE_GRABADOR:
      creaDirectorio("prueba");
      recorreDirectorio();
      break;
  }
}

