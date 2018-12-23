import 'package:flutter/material.dart';

class MainForm1 extends StatelessWidget {
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
  String _descripcion;
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
              new TextFormField(
                decoration: new InputDecoration(
                            labelText: 'usuario',
                           icon: const Icon(Icons.person),
                  hintText: 'Cual es el nombre de usuario?',
                ),
                validator: (String value) {
                  if (value.isEmpty) return "Debe ingresar un usuario.";
                  return null;
                },

                onSaved: (val) => _user = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                       labelText: 'Your email',
                       border: InputBorder.none,
                        ),
                validator: (val) =>
                !val.contains('@') ? 'Not a valid email.' : null,
                onSaved: (val) => _email = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Your password'),
                validator: (val) => val.length < 6 ? 'Password too short.' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),   new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Descripcion",
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (val) => _descripcion = val,
              ),
              ///////////////////////

              ///////////////////////////////
              new Row(
                  children:[
                    new Checkbox(
                      tristate: false,
                      value: _checkboxValue,
                      onChanged: (bool value) {
                        setState(() {
                          _checkboxValue = value;
                        });
                      },
                    ),
                    new Text("CheckBox")
                  ]

              ),
              ////////////////////////////////
              new Row(
                  children: <Widget>[
                    new Radio<int>(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue = value;
                          });
                        }

                    ),
                    new Radio<int>(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: (int value) {
                          setState(() {
                            _radioValue = value;
                          });
                        }
                    ),
                    new Radio<int>(
                        value: 2,
                        groupValue: _radioValue,
                        onChanged:(int value) {
                          setState(() {
                            _radioValue = value;
                          });
                        }
                    )
                  ]
              ),
              ////////////////////////////////
              new Row(
                  children:[
                    new Text("País"),
                    new DropdownButton<String>(
                        value: _dropdownValue,
                        onChanged: (String newValue) {
                          // null indicates the user didn't select a
                          // new value.
                          setState(() {
                            if (newValue != null)
                              _dropdownValue = newValue;
                          });
                        },
                        items: <String>['Chile', 'Perú', 'Árgentina', 'Colombia']
                            .map((String value) {
                          return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value));
                        })
                            .toList()
                    ),
                  ]
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