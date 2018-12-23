import 'package:flutter/material.dart';

class MainBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _user;
  String _email;
  String _password;
  bool _checkboxValue = false;
  int _radioValue = 0;
  bool _switchValue = false;
  String _dropdownValue;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = new SnackBar(
      content: new Text('usuario:_usuario,Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Validating forms'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new ListView(

            children: [
              new OutlineButton(
              child: const Text('BUTTON Outline habilitado'),
                onPressed: () {
                  // Perform some action
                }
            ),
              ////////////////////////////////
        const OutlineButton(
            child: const Text('BUTTON Outline deshabilitado'),
            onPressed: null
        ),
              /////////////////////////////////
        new FlatButton(
            child: const Text('BUTTON Flat'),
            onPressed: () {
              // Perform some action
            }
        ),
              ////////////////////////////////
              new RaisedButton(
                onPressed: _submit,
                child: new Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}