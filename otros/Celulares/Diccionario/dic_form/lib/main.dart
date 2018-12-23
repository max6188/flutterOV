import 'package:flutter/material.dart';
//https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/gallery/example_code.dart#L148
import "formValidador.dart";
import "botones.dart";
import "oWidget.dart";



enum PROCESO {
  FORM_VALIDADOR,
  BOTONES,
  VALIDA_OWIDGET
}

void main() {

  PROCESO p=PROCESO.VALIDA_OWIDGET;
  switch(p){
    case PROCESO.FORM_VALIDADOR:
        runApp(new MainForm1());
        break;
    case PROCESO.BOTONES:
      runApp(new MainBoton());
      break;
    case PROCESO.VALIDA_OWIDGET:
      runApp(new MainForm2());
      break;

  }

}




