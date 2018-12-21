import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }
class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  Drawer _getDrawer(BuildContext context)
  {
    var header  = new  DrawerHeader(
      child: Text('Drawer Header'),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
    var info = new AboutListTile(
      child: new Text("Información App"),
      applicationVersion: "v1.0.0",
      applicationName: "Demo drawer",
      applicationIcon: new Icon(Icons.favorite),
      icon: new Icon(Icons.info),
    
    );
  ListTile _getItem(Icon icon, String description, String route){
    return new ListTile(

      leading: icon,
      title: new Text(description),
      onTap: () {
        setState(() {
			if(route!="") Navigator.of(context).pushNamed(route);
			else {
			}
        });
      }
    );
    
  }
    ListView listView = new ListView(
        padding: EdgeInsets.zero,

        children: <Widget>[
    header,
    new Container(color: Colors.teal.shade700,
     child: _getItem(new Icon(Icons.settings), 'Configuración', "/huevona"),
    ),
    new Container(color: Colors.teal.shade700,
          child: _getItem(new Icon(Icons.home), 'Página Principal', "/"),
    ),
    _getItem(new Icon(Icons.battery_charging_full), "Batería", "/huevona"),
    ListTile(leading:new Icon(Icons.settings),
        title:new Text("que cosas"),
        onTap:(){
        }),
    info
   ]);

      return new Drawer(
        child: listView,
      );
  }
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Demo Menu"),
       actions: <Widget>[

          new IconButton(
            icon: new Icon(Icons.access_time),
            tooltip: 'Inyección',
            onPressed: (){
              Navigator.of(context).pushNamed("/huevona");
            },
          ),

         new IconButton(
           icon: new Icon(Icons.verified_user),
           tooltip: 'Registro',
           onPressed: (){
         },
         ),

       ],
     bottom: new TabBar(
       tabs: <Widget>[
         new Tab(
           icon: new Icon(Icons.home),
         ),
         new Tab(
           text: "chats",
         ),
         new Tab(
           icon: new Icon(Icons.contacts),
         )
       ],
       controller: controller,
     ),
     ),
     drawer: _getDrawer(context),
    floatingActionButton: new FloatingActionButton(
    tooltip: 'Agregar',
    child: new Icon(Icons.add),
    onPressed:(){
      Navigator.of(context).pushNamed("/huevona");
    }),

     body: new TabBarView(
     children: <Widget>[
    new Huevona(), new Huevona(), new Container()
    ],
    controller: controller
    )

   );
  }
}

class Huevona extends StatelessWidget {
  static const String routeName = "/huevona";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Clase Huevona")
      ),
      body: new Container(
          child: new Center(
              child: new Text("Pantalla Huevona")
          )
      ),

    );
  }
}








