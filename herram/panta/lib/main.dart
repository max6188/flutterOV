import 'package:flutter/material.dart';
import  'package:keyboard_actions/keyboard_actions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
FocusNode _nodeText1 = FocusNode();
  FocusNode _nodeText2 = FocusNode();
  FocusNode _nodeText3 = FocusNode();
  FocusNode _nodeText4 = FocusNode();
  FocusNode _nodeText5 = FocusNode();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keyboard Actions Sample"),
      ),
      body: FormKeyboardActions(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL, //optional
        keyboardBarColor: Colors.grey[200], //optional
        nextFocus: true, //optional
        actions: [
          KeyboardAction(
            focusNode: _nodeText1,
          ),
          KeyboardAction(
            focusNode: _nodeText2,
            closeWidget: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {},
            ),
          ),
          KeyboardAction(
            focusNode: _nodeText3,
            onTapAction: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Custom Action"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    );
                  });
            },
          ),
          KeyboardAction(
            focusNode: _nodeText4,
            displayCloseWidget: false,
          ),
          KeyboardAction(
            focusNode: _nodeText5,
            closeWidget: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("CLOSE"),
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _nodeText1,
                  decoration: InputDecoration(
                    hintText: "Input Number",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  focusNode: _nodeText2,
                  decoration: InputDecoration(
                    hintText: "Input Text with Custom Close Widget",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _nodeText3,
                  decoration: InputDecoration(
                    hintText: "Input Number with Custom Action",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  focusNode: _nodeText4,
                  decoration: InputDecoration(
                    hintText: "Input Text without Close Widget",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  focusNode: _nodeText5,
                  decoration: InputDecoration(
                    hintText: "Input Number with Custom Close Widget",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}