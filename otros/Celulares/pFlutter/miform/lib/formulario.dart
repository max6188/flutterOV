
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "usuario.dart";
import "validaciones.dart" as lv;


class PLoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<PLoginPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  Usuario usuario = new Usuario();
  final lv.UsNumberTextInputFormatter _phoneNumberFormatter = new lv.UsNumberTextInputFormatter();

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
     }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Ingreso de usuarios'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          autovalidate:true,

          child: new ListView(
            children: [
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
              new RaisedButton(
                onPressed: _submit,
                child: new Text('Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
