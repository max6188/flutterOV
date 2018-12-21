import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import "package:editor3/mgrafica_mensajeriaV2.dart";
import "package:editor3/tdataform.dart";

class FrmEditorTDA extends StatefulWidget {
  @override
  _FrmEditorTDA createState() => new _FrmEditorTDA();
}

class _FrmEditorTDA extends State<FrmEditorTDA> {
  bool lecturacompleta = true;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MgraficaMensajeria mje = new MgraficaMensajeria();
  bool cambiaFormulario = false;
  Data d = new Data();


  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    //d.dRutCtrl.dispose();
    //d.dRutCtrl.dispose();
    super.dispose();
  }

  Future<bool> _willPop() async {
    print("que onda");
    final FormState form = _formKey.currentState;
   // if (form == null || !cambiaFormulario || form.validate())
   //   return true;
    print("llega hasta aca");
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Este formulario tiene cambios'),
          content: const Text('Realmente abandonas este cambio?'),
          actions: <Widget> [
            FlatButton(
              child: const Text('SI'),
              onPressed: () { Navigator.of(context).pop(true); },
            ),
            FlatButton(
              child: const Text('NO'),
              onPressed: () { Navigator.of(context).pop(false); },
            ),
          ],
        );
      },
    ) ?? false;
  }
  Widget elFormulario(BuildContext context) {
    return new Form(
        key: _formKey,
        autovalidate: true,
        onWillPop: _willPop,
        child: new ListView(
          physics: new ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          children: [

            new RutTD2(
                rutCtrl: d.rutCtrl,
                dvCtrl: d.dRutCtrl,
                esObligatorio:true,

                onFieldSubmitted: (String rut) {
                  cambiaFormulario=false;
                   print(d.rutCtrl.text+"-"+d.dRutCtrl.text);
                }),

            new CorreoTD(
                valorInicial: d.correo,
                esObligatorio: true,
                puedeSerNulo:true,
                onFieldSubmitted: (String correo) {
                  d.correo = correo;}),

            new FonoTD(
                hintText:"Fono",
                labelTex:"Fono",
                valorInicial: d.fono,
                esObligatorio:true,
                puedeSerNulo:true,
                onFieldSubmitted: (String fono) {
                  print("Foono final $fono");
                  d.fono = fono.replaceAll("-", "");;
                }),


              new EnteroTD(
                 hintText: "HintText",
                 labelText: "labelText",
                 valorInicial:d.entero,
                 esObligatorio:true,
                 puedeSerNulo:false,
                 desde:0.0,
                 estrictoDesde:true,
                 hasta:10000000.0,
                 estrictoHasta:false,
                 onFieldSubmitted: (String entero) {
                    d.entero = int.tryParse(alternoComa(entero));
                    print(entero);


                  }),

            new CantidadTD(
                hintText: "Cantidad",
                labelText: "Cantidad",
                icono: Icons.confirmation_number,
                valorInicial: d.cantidad,
                esObligatorio: true,
                puedeSerNulo: false,
                desde: 0.0,
                estrictoDesde: true,
                hasta: 100.0,
                estrictoHasta: false,
                onFieldSubmitted: (String cantidad) {
                  d.cantidad = double.tryParse(alternoComa(cantidad));
                  print(d.cantidad);
            }),


            const SizedBox(height: 24.0),
            new Container(
                padding: const EdgeInsets.only(top: 25.0),
                child: new RaisedButton(
                    child: const Text("Grabar"),
                    onPressed: () {
                      _submit(context);
                    })),
          ],
        ));
  }
  //Generacion de variables

  void _submit(BuildContext context) {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      grabar();
    } else {
      print("no entra");
    }
  }

  void grabar() {
    Navigator.of(context).pop(true);
  }

  //principal
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(title: new Center(child: Text('Editor'))),
        body: !lecturacompleta
            ? mje.simpleCentrado(context, 'Esperando servidor...')
            : new SafeArea(
                top: false,
                bottom: false,
                minimum: const EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                child: new Container(
                  decoration: new BoxDecoration(
                    // Add Gradient
                    gradient: new LinearGradient(
                        colors: [Colors.green[100], Colors.green[800]],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.6, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: elFormulario(context),
                )));
  }
}

class Data {
  TextEditingController rutCtrl;
  TextEditingController dRutCtrl;
  String correo;
  String fono;
  int entero;
  double cantidad;
  String rut;

  Data() {
    rutCtrl = new TextEditingController();
    dRutCtrl = new TextEditingController();
    rutCtrl.text = "";
    dRutCtrl.text = "";

    correo = "";
    rut="";
    fono = "982574971";
    entero = 0;
    cantidad = 0.0;
  }
}
