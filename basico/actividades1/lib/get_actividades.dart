import 'package:flutter/material.dart';


class GetActividades extends StatelessWidget {
  final TextEditingController _newTitleController = new TextEditingController();
  final Key textInputKey;
  final VoidCallback  fxPresCursor;
  final bool hayRegistros;
  final bool deseaAgregar;
  final ValueSetter<String> onAddTodo;



  GetActividades({this.textInputKey, this.fxPresCursor,
                  this.hayRegistros, this.deseaAgregar,
                  this.onAddTodo}):  super(key: textInputKey);


  @override
  Widget build(BuildContext context) {
    final List<Widget> fWidget = <Widget>[];

    if (deseaAgregar) {
      fWidget.add(new IconButton(
        icon: new Icon(
          Icons.arrow_downward,
          color: Colors.lightBlue,
        ),
        alignment: Alignment.bottomCenter,
        onPressed: this.fxPresCursor,
      ));
       fWidget.add(new Expanded(
        flex: 2,
        child: new TextField(
          key: textInputKey,
          controller: _newTitleController,
          decoration: new InputDecoration(hintText: 'Que haras?'),
          onSubmitted: (String value) {
            // Notify that we're adding a new item, and clear the text field
            this.onAddTodo(value);
             _newTitleController.text = "";
          },
        ),
    )); } else {
      fWidget.add(new Expanded(

        child:new ListTile(
          title:new Text("ingrese una nota!"),
          leading: new IconButton(
            icon: new Icon(
              Icons.attachment,
              color: Colors.lightGreen,
            ),
            alignment: Alignment.bottomCenter,
            onPressed: this.fxPresCursor,
          )),
        )
      );
     }


    LinearGradient getCustomGradient() {
      // Define a Linear Gradient
      return new LinearGradient(
          colors: [Colors.green, Colors.greenAccent],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp);
    }

    return new Padding(

      // If we have the toggle all box, left the icon be our left padding
      padding: new EdgeInsets.fromLTRB( 10.0, 10.0, 10.0, 10.0),
      child: new Container(
        decoration:new BoxDecoration(
          // Add Gradient
            gradient: getCustomGradient()
        ),

        child:new Row(
                  children: fWidget),
               ));
  }



}