
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "usuario.dart";
import "validaciones.dart" as lv;


class PLoginPage2 extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<PLoginPage2> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  bool saved = false;
  Usuario usuario = new Usuario();
  final lv.UsNumberTextInputFormatter _phoneNumberFormatter = new lv.UsNumberTextInputFormatter();
  final lv.RutFormatterVigente _rutNumberFormatter = new lv.RutFormatterVigente();


//aca van los atributos privados

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      _performLogin();
    }
  }



  void _performLogin() {
    // aca se debiera grabar o realizar el login
    saved = true;
    print("Aca se graba");
  }



  Future<bool> willPop() async {
    final FormState form = formKey.currentState;
    if (form == null || form.validate())
      return true;

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text('This form has errors'),
          content: const Text('Really leave this form?'),
          actions: <Widget> [
            new FlatButton(
              child: const Text('YES'),
              onPressed: () { Navigator.of(context).pop(true); },
            ),
            new FlatButton(
              child: const Text('NO'),
              onPressed: () { Navigator.of(context).pop(false); },
            ),
          ],
        );
      },
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("prueba de formularios"),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: formKey,
              autovalidate: true,
              onWillPop: willPop2,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
              //Nombre de usuario
              new TextFormField(
              decoration: const InputDecoration(
              icon: const Icon(Icons.person),
            hintText: 'Entre nombre de usario',
            labelText: 'Usuario',
          ),
        inputFormatters: [new LengthLimitingTextInputFormatter(10)],
        validator: (val) => val.isEmpty ? 'Nombre es Requerido' : null,
        onSaved: (val) => usuario.usuario = val,
      ),
      // correo

      new TextFormField(
        decoration: const InputDecoration(
          icon: const Icon(Icons.email),
          hintText: 'Ingrese Correo',
          labelText: 'Correo',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) => lv.isValidEmail(value) ? null : 'Ingresa una direccion de correo válida',
        onSaved: (val) => usuario.correo = val,
      ),

      //Fono
      //const SizedBox(height: 24.0),
      new TextFormField(
        decoration: const InputDecoration(
          border: const UnderlineInputBorder(),
          filled: true,
          icon: const Icon(Icons.phone),
          hintText: 'Como te llamamos?',
          labelText: 'Celular *',
          prefixText: '+56',
        ),
        keyboardType: TextInputType.phone,
        onSaved: (String value) { usuario.celular = value; },
        validator: lv.validatePhoneNumber,
        // TextInputFormatters are applied in sequence.
        inputFormatters: <TextInputFormatter> [
          WhitelistingTextInputFormatter.digitsOnly,
          // Fit the validating format.
          _phoneNumberFormatter,
        ],
      ),

                  //Rut

              new TextFormField(
                decoration: const InputDecoration(
                  border: const UnderlineInputBorder(),
                  filled: true,
                  icon: const Icon(Icons.fiber_dvr),
                  hintText: 'Cédula de identidad?',
                  labelText: 'Cédula *',
                ),
                keyboardType: TextInputType.text,
                onSaved: (String value) { usuario.rut = value; },
                validator: lv.validaRut,
                // TextInputFormatters are applied in sequence.
                inputFormatters: <TextInputFormatter> [
                  WhitelistingTextInputFormatter.digitsOnly,

                  // Fit the validating format.
                  _rutNumberFormatter,
                ],
              ),

              new RaisedButton(
                onPressed: _submit,
                child: new Text('Agregar'),
              ),

                    ],
              ))),
    );
  }

}

