import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


bool isValidEmail(String input) {
  //https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/text_form_field_demo.dart
  final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return regex.hasMatch(input);
}


String validatePhoneNumber(String value) {
  final RegExp phoneExp = new RegExp(r'^\(\d\) \d\d\d\d\.\d\d\d\d');
  if (!phoneExp.hasMatch(value) )
    return '(#) ####.#### - Enter a numero de stgo.';
  return null;
}


String validaRut(String value) {
  //99.999.999.999-x
  if(1==1)return null;
  String doyDigito(String valueRut) {
    List <int> multi = [2, 3, 4, 5, 6, 7, 2, 3];

    List <String> aRut = (valueRut)
        .split('')
        .reversed;
    int i;
    int suma = 0;
    String dv="";
    for (i == 0; i < aRut.length; i++) {
      suma += int.parse(aRut[i]) * multi[i];
    }
    int resto = suma - 11 * (suma / 11).toInt();
    int resta= 11 - resto;
    if (resta==11) dv="0";
    else if(resta==10) dv="k";
    else dv=resta.toString();
    return dv;
  }


  String dv;
  String dvc;
  if (value.length==12) dvc=  doyDigito(value);
  else if (value.length==11) dvc=  doyDigito("0$value");
  else return " Formato 99.999.999-X";
  dv = value.substring(value.length -1);
  if(dv==dvc) return null;
  return "Dígito veridicador no corresponde";

}




//////////////////////Formatos//////////////////////
class UsNumberTextInputFormatter extends TextInputFormatter {
  //(2)3456.7890
  // //https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/text_form_field_demo.dart
  /// Format incoming numeric text to fit the format of (###) ###-#### ##...
  ///
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {

    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
     final StringBuffer newText = new StringBuffer();

    int nc = int.parse(newValue.text.substring(0, 1));


    if (nc == 2) {
      //(2)1234.5678
      if (newTextLength >= 1) {
        newText.write("(2)");
        selectionIndex =3;
       }
       if (newTextLength>=9  ){
         StringBuffer tr = new StringBuffer();
         tr.write(newValue.text.substring(1,5));
         tr.write(".");
         tr.write(newValue.text.substring(5,9));
         newText.write(tr);
         selectionIndex+=tr.length;
      } else  if(newTextLength>5) {
         StringBuffer tr = new StringBuffer();
         tr.write(newValue.text.substring(1,5));
         tr.write(".");
         tr.write(newValue.text.substring(5));
         newText.write(tr);
         selectionIndex+=tr.length;
       } else if (newTextLength>=2){
         StringBuffer tr=new StringBuffer();
         tr.write(newValue.text.substring(1));
         newText.write(tr.toString());
         selectionIndex+=tr.length;
       }
    } else if (nc == 0 || nc == 9) {
      //(09)1234.5678

    } else {
        newText.write(nc.toString());
        selectionIndex++;
    }


      return new TextEditingValue(
        text: newText.toString(),
        selection: new TextSelection.collapsed(offset: selectionIndex),
      );
    } //nc
  } //UsNumberTextInputFormatter

class RutFormatterVigente extends TextInputFormatter {
  //99.999.999-X
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    final StringBuffer newText = new StringBuffer();

    int nc = int.parse(newValue.text.substring(0, 1));


    if (nc == 1 || nc == 2) {
      //17.234.555-6
      switch (newTextLength) {
        case 1:
        case 2:
          newText.write(newValue.text);
          selectionIndex = newTextLength;
          break;
        case 3:
        case 4:
        case 5:
          newText.write(newValue.text.substring(0, 2));
          newText.write(".");

          newText.write(newValue.text.substring(2));
          selectionIndex=nc+1;
          break;
        case 6:
        case 7:
        case 8:
          //99.999.999-X
          //12345678
          newText.write(newValue.text.substring(0, 2));
          newText.write(".");
          newText.write(newValue.text.substring(2, 5));
          newText.write(".");
          newText.write(newValue.text.substring(5));
          selectionIndex=nc+2;
          break;
        default:
          newText.write(newValue.text.substring(0, 2));
          newText.write(".");
          newText.write(newValue.text.substring(2, 5));
          newText.write(".");
          newText.write(newValue.text.substring(5, 8));
          newText.write("-");
          newText.write(newValue.text.substring(8, 9));
          selectionIndex=9+3;
          break;
      }
    }
      return new TextEditingValue(
        text: newText.toString(),
        selection: new TextSelection.collapsed(offset: selectionIndex),
      );
    } //nc
  } //UsNumberTextInputFormatter

