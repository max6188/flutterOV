import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import "todo_item.dart";
import "mgrafica_combo_texto.dart" as mg;

class DespliegaLista extends StatefulWidget {
  final TodoItem todo;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<int> onPrioridadChanged;
  int prioridad;

  final VoidCallback onDelete;
  final ValueChanged<bool> onChanged;

  DespliegaLista({
    Key key,
    @required this.todo,
    this.onTitleChanged,
    this.onDelete,
    this.onChanged,
    this.onPrioridadChanged
  }) :super(key: key);

  @override
  State<StatefulWidget> createState() => new _DespliegaLista();
}

class _DespliegaLista extends State<DespliegaLista> {
  final TextEditingController _editTitleController = new TextEditingController();
  final TextEditingController _editPrioridadController = new TextEditingController();

  bool _editMode;

  @override
  void initState() {
    super.initState();
    _editMode = false;
    widget.prioridad = 1;
  }

  Widget _editaTitulo() {
    final String titulo = widget.todo.titulo;

    // Make sure the controller always has our current value
    _editTitleController.text = titulo;



    // Select all the text when we show the edit box
    _editTitleController.selection =
    new TextSelection(baseOffset: 0, extentOffset: titulo.length);

    return new TextField(

      autofocus: true,
      controller: _editTitleController,
      onSubmitted: (value) {
        setState(() {
          _editMode = false;
        });
        widget.onTitleChanged(value);
      },
    );
  }

  Widget _editaPrioridad() {
    final String prioridad = widget.todo.prioridad == null ? "1" : widget.todo
        .prioridad.toString().trim();

    _editPrioridadController.text = prioridad;

    // Select all the text when we show the edit box
    //_editTitleController.selection = new TextSelection(baseOffset: 0, extentOffset: prioridad.length);

    return new TextField(

      autofocus: true,
      controller: _editPrioridadController,
      onSubmitted: (value) {
        setState(() {
          _editMode = false;
        });
        int pri = int.parse(value);
        widget.onPrioridadChanged(pri);
      },
    );
  }


  Widget _construyeTitulo() {
    return new GestureDetector(
      child: new Text(widget.todo.titulo),
      onLongPress: () {
        // Long press to edit
        if (widget.onTitleChanged != null) {
          setState(() {
            _editMode = true;
          });
        }
      },
    );
  }

  void valSeleccionado(String vCombo){
   widget.onPrioridadChanged(int.parse(vCombo));
  }


  @override
  Widget build(BuildContext context) {
    final Widget tituloFinal = _editMode ? _editaTitulo() : _construyeTitulo();
    final double fontSize = Theme
        .of(context)
        .textTheme
        .body1
        .fontSize;

    List<String> _prioridades = <String>['1', '2', '3'];
    String _prioridad = (widget.todo.prioridad == null) ? "3" : widget.todo.prioridad.toString();;

    LinearGradient getCustomGradient() {
      // Define a Linear Gradient
      return new LinearGradient(
          colors: [Colors.green, Colors.blueAccent],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp);
    }

    return new ListTile(
        title: Container(
            decoration:new BoxDecoration(
              // Add Gradient
                gradient: getCustomGradient()
            ),
            //padding: EdgeInsets.all(1.0),
            child: Row(
                children: <Widget>[
                  new Checkbox(
                    value: widget.todo.listo,
                    onChanged: widget.onChanged,
                  ),
                  new mg.Combo(
                    lCosas:_prioridades,
                    primerValor:_prioridad,
                    onGetDD:valSeleccionado,
                  ),
                  Expanded(
                      child: tituloFinal
                  ),
              new IconButton(
              icon: new Icon(Icons.delete),
              onPressed: widget.onDelete,
            ),
                ]
            )
        ),

    );
  }
}

