import "los_enumerados.dart";
import "todo_item.dart";


class ManejaListas {
  List<TodoItem> muestra;
  List<TodoItem> todos;
  TipoFiltro fOrigen;
  TipoFiltro fDestino;

  ManejaListas({this.muestra, this.todos});

  void copiaLista(TipoFiltro fOrigen, TipoFiltro fDestino) {
    switch (fOrigen) {
      case TipoFiltro.TODO:
        switch (fDestino) {
          case TipoFiltro.PTE:
            _todoPte();
            break;
          case TipoFiltro.LISTO:
            _todoListo();
            break;
          default:
            return;
        };
        break;
      case TipoFiltro.PTE:
        switch (fDestino) {
          case TipoFiltro.TODO:
              _pteTodo();
            break;
          case TipoFiltro.LISTO:
            _pteListo();
            break;
          default:
            return ;
        };
        break;
      case TipoFiltro.LISTO:
        switch (fDestino) {
          case TipoFiltro.TODO:
            _listoTodo();
            break;
          case TipoFiltro.PTE:
            _listoPte();
            break;
          default:
            return ;
        };
        break;
      default:
        return ;
    }
    return ;
  }

  void _todoPte() {
    todos = muestra;
    muestra = muestra.where((t) => t.listo != true).toList(growable: false);
  }

void _todoListo(){
  todos=muestra;
  muestra= muestra.where((t) => t.listo ==true).toList(growable: false);
}


void _pteTodo(){

  todos.removeWhere((t) => t.listo == null||t.listo==false);
  for (TodoItem t in muestra) {
    this.todos.add(t);
  }
  muestra=todos;
}

void _pteListo(){
  todos.removeWhere((t) => t.listo == null||t.listo==false);
  for (TodoItem t in muestra) {
    todos.add(t);
  }

  muestra=[];
  for (TodoItem t in todos) {
    if(t.listo==true) muestra.add(t);
  }
}

void _listoTodo(){
  todos.removeWhere((t) => t.listo ==true);
  for (TodoItem t in muestra) {
    todos.add(t);
  }
  muestra=todos;
}

void _listoPte(){
  todos.removeWhere((t) => t.listo ==true);
  for (TodoItem t in muestra) {
    todos.add(t);
  }
  muestra=[];
  for (TodoItem t in todos) {
    if(t.listo==false||t.listo==null) muestra.add(t);
  }
}
}