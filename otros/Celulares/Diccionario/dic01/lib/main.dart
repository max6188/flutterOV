import 'package:flutter/material.dart';
import "scaff.dart";
import "gestureDetec.dart";

import "botones.dart";


enum PROCESO {SCAFF_SIMPLE,
              SCAFF_BOTON_APPBAR,
              SCAFF_PRUEBA_DRAWER,
              SCAFF_SNACKBARDEMO,
              SCAFF_SNACKBARDEMO2,
              GESTURE_BOTTON,
              GESTURE_MAIN,




}

void main() {

  PROCESO p=PROCESO.FORM_VALIDADOR;
  switch(p){
    case PROCESO.SCAFF_SIMPLE:
      runApp(new MaterialApp(
        title: 'Diccionario  Flutter',
        home:  new Scaff01(),
      ));
      break;

    case PROCESO.SCAFF_BOTON_APPBAR:
      runApp(new MaterialApp(
        title: 'Diccionario  Flutter',
        home:  new Scaff03(),
      ));
      break;
    case PROCESO.SCAFF_PRUEBA_DRAWER:
      runApp(new PruebaDrawer());
      break;
    case PROCESO.SCAFF_SNACKBARDEMO:
      runApp(new SnackBarDemo());
      break;

    case PROCESO.SCAFF_SNACKBARDEMO2:
      runApp(new SnackBarDemo2());
      break;

    case PROCESO.GESTURE_BOTTON:
      runApp(new miGesture());
      break;
    case PROCESO.GESTURE_MAIN:
      runApp(new MainGesture());
      break;

  }

}




