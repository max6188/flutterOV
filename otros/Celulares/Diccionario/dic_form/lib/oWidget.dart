import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class MainForm2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage2(),
    );
  }
}

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage2> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  SingingCharacter _character = SingingCharacter.lafayette;





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
    String _email="correo";
    String _password="POJO";
    final snackbar = new SnackBar(
      content: new Text('Email: $_email, password: $_password'),
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
              new Column(
                children: <Widget>[
                  new RadioListTile<SingingCharacter>(
                    title: const Text('Lafayette'),
                    value: SingingCharacter.lafayette,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
                  ),
                  new RadioListTile<SingingCharacter>(
                    title: const Text('Thomas Jefferson'),
                    value: SingingCharacter.jefferson,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
                  ),
                ],
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