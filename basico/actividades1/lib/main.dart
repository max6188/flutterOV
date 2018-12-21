import 'package:flutter/material.dart';

import "todo_item.dart";
import "get_actividades.dart";
import "despliega_registro.dart";
import "los_enumerados.dart";
import "maneja_listas.dart" ;

void main() {
  runApp(new MaterialApp(
    title: 'Lista de actividades 1/3',
      theme: new ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],
      ),


    home: new Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  TipoFiltro filtroOpcion;
  int numLineas;
  ManejaListas m;
  //List<TodoItem> muestra;
  //List<TodoItem> todos;


  bool deseaAgregar;



  @override
  void initState() {
    super.initState();
    filtroOpcion = TipoFiltro.TODO;
    numLineas=0;
    deseaAgregar=false;
    m = new ManejaListas(
      muestra:[],
      todos:[]
    );



  }

  void seteaFiltro(TipoFiltro filtro) {
    setState(() {
      this.filtroOpcion = filtro;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    numLineas=m.muestra.length;
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Actividades'),
       ),
      backgroundColor: Colors.lightBlueAccent,
      body:new Column(
        children:<Widget>[
          new GetActividades(
              textInputKey:new Key('todo-header'),
              fxPresCursor:presCursor,
              hayRegistros:veLosRegistros(),
              deseaAgregar:deseaAgregar,
              onAddTodo:grabaItem
              ),
          new Expanded(
            flex: 2,
            child: new ListView.builder(
              key: new Key('todo-list'),
              itemCount: m.muestra.length,

              itemBuilder: (BuildContext context, int idx) {
                     final TodoItem todo = m.muestra[idx];
                         return DespliegaLista(
                         key: new Key('todo-${todo.id}'),
                         todo: todo,
                        onChanged: (value) {
                            setState(() {
                               todo.listo = value;
                            });
                         },
                        onTitleChanged: (nuevoTitulo) {
                             this._editTodo(todo, nuevoTitulo);
                         },
                       onPrioridadChanged: (prioridad) {

                         this._editPrioridad(todo, prioridad);
                       },
                       
                       onDelete: () {
                          setState(() {
                             m.muestra.removeWhere((t) => t.id == todo.id);
                          });
                        },
             );
            }
            ),
          ),
          new Text("que onda"),
        ]
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.white,
        child: bottomAppBarContents(),
      ),
      floatingActionButton: new FloatingActionButton( //el botón flotante
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: (){
          setState(() {
            deseaAgregar=true;
          });

        },
      ),
    );
  }

  void _editTodo(TodoItem todo, String nuevoTitulo) {
    setState(() {
      todo.titulo = nuevoTitulo;

    });
  }


  void _editPrioridad(TodoItem todo, int prioridad) {
    setState(() {
        todo.prioridad = prioridad;

    });
  }


void  presCursor(){
return ;
}

bool veLosRegistros(){
    return true;
}

void grabaItem(String titulo){
  setState(() {
    m.muestra.add(new TodoItem(
      id: m.muestra.length.toString(),
      prioridad:3,
      titulo: titulo,
      listo:false
    ));
    deseaAgregar=false;
    });
}



  Widget bottomAppBarContents() {
  String despNumLineas =numLineas>0?"${numLineas.toString()}":"";
  return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
      [
        new Text(numLineas.toString(),
            textAlign: TextAlign.center,
            style: new TextStyle(color: Colors.black)
        ),
        new RaisedButton(
          key: new Key('btnTodo'),
          color: filtroOpcion == TipoFiltro.TODO ? Colors.blue : Colors.black12,
          child: new Text('Td.'),

          onPressed: () {
              m.copiaLista(filtroOpcion,TipoFiltro.TODO);
              seteaFiltro(TipoFiltro.TODO);
          },
        ),

        new RaisedButton(
          color: filtroOpcion == TipoFiltro.LISTO ? Colors.blue : Colors.black12,
          child: new Text('Lto.'),
          onPressed: () {
            m.copiaLista(filtroOpcion,TipoFiltro.LISTO);
            seteaFiltro(TipoFiltro.LISTO);
            },


        ),

        new RaisedButton(
           color: filtroOpcion == TipoFiltro.PTE ? Colors.blue : Colors.black12,
          child: new Text('Pte.'),
          onPressed: () {
            m.copiaLista(filtroOpcion,TipoFiltro.PTE);
            seteaFiltro(TipoFiltro.PTE);
           },
        ),
      ]
  );
}


}