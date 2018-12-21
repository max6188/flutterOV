
import 'package:flutter/material.dart';
import 'package:pracscroll/tabbar/page1.dart';
class Tabita extends StatefulWidget {
  @override
  _Tabita createState() => new _Tabita();
}

class _Tabita extends State<Tabita>  with SingleTickerProviderStateMixin {

  btnTap(Widget page) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true, builder: (BuildContext context) => page));
  }

  _buildCustomButton(String text, Widget page,
      {bool isPopup = false, bool isCustom = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 40.0,
        padding: EdgeInsets.all(10.0),
        color: Colors.lightBlue,
        onPressed: () {
          if (isPopup) {
            print("entra aca");
            btnTap(page);
          } else if (isCustom) {
           // _onButtonTapCustom(page);
          } else {
           // _onButtonTap(page);
          }
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13.0),
        ),
      ),
    );
  }


  TabController controller;
  @override
  void initState() {
  super.initState();
    controller = new TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Video Tabs"),
          //backgroundColor: Colors.redAccent,
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.home),
              ),
              new Tab(
                icon: new Icon(Icons.ondemand_video),
              ),
              new Tab(
                icon: new Icon(Icons.contacts),
              ),
              new Tab(
                icon: new Icon(Icons.contacts),
              ),
              new Tab(
                icon: new Icon(Icons.contacts),
              )
            ],
            controller: controller,
          ),
        ),
        body: new TabBarView(
            children: <Widget>[
              new CustomLogo(), _buildCustomButton("hero1",Page1()), new Container(),new Container(),new Container()
            ],
            controller: controller
        )
    );
  }
}

class CustomLogo extends StatelessWidget {
  final double size;

  CustomLogo({this.size = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
          "fotos/chica8.jpg",
          width: size,
          height: size,
        ),
      ),
    );
  }
}
