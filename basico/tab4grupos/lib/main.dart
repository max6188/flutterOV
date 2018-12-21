import 'package:flutter/material.dart';

void main() {
 // runApp(new Goce());
  runApp( new MaterialApp(
  home: new Goce(),
  ));
}

class Goce extends StatefulWidget {
  @override
  _GoceEstado createState() => new _GoceEstado();
}

class _GoceEstado extends State<Goce> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Size size;

  _GoceEstado();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: list.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _paginaSiguiente(int delta) {
    //Permite ir hacia la proxima página o la anteriro
    int newIndex;
    newIndex = _tabController.index + delta;
    if (newIndex < 0)
      newIndex = _tabController.length - 1;
    else if (newIndex >= _tabController.length) newIndex = 0;
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;

    // build small image.
      return new MaterialApp(

          home: new Scaffold(
            appBar: new AppBar(
              title: const Text('appbar 4 grupos'),
              leading: new IconButton(
                tooltip: 'Previa',
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _paginaSiguiente(-1);
                },
              ),
              actions: <Widget>[
                new IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  tooltip: 'Siguiente',
                  onPressed: () {
                    _paginaSiguiente(1);
                  },
                ),
              ],
              bottom: new TabBar(
                tabs: <Tab>[
                  new Tab(
                    text: "Copete",
                    icon: new Icon(Icons.insert_emoticon),
                  ),
                  new Tab(
                    text: "Cuete",
                    icon: new Icon(Icons.history),
                  ),
                  new Tab(
                    text: "dios",
                    icon: new Icon(Icons.gps_off),
                  ),
                  new Tab(
                    text: "Censurado",
                    icon: new Icon(Icons.report_problem),
                  ),

                ],


                controller: _tabController,
              ),
            ),
            body: new TabBarView(
              controller: _tabController,
              children: list.map((Grupo grupo) {
                return new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: getCuerpo(grupo,size),
                );
              }).toList(),
            ),
          ));
    }
  }


class Grupo{
  String nombre;
  String foto;

  Grupo(this.nombre, this.foto);

}

List<Grupo> list =  [
  new Grupo("copete","fotos/copete.jpg"),
  new Grupo("cuete","fotos/cuete.jpg"),
  new Grupo("dios","fotos/dios.jpg"),
  new Grupo("censurado","fotos/censurado.png")
];


Column getCuerpo(Grupo g,Size size){
  double width=size.width/1.8;        //  360/1.8=200.0;
  double  height=size.height/3.0;     // 592/3.0=200
  return new Column(
      children:[
        new Image.asset(
          g.foto,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
        new Text(g.nombre),
      ]);
}