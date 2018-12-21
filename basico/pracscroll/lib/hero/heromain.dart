import 'package:flutter/material.dart';
import 'package:pracscroll/hero/page1.dart';

class HeroMain extends StatefulWidget {
  @override
  _HeroMain createState() => new _HeroMain();
}

class _HeroMain extends State<HeroMain> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String texto="Mariposa";
    return new  Container(
        width: MediaQuery.of(context).size.width,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      //simple Hero
    Padding(
   padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 40.0,
        padding: EdgeInsets.all(10.0),
        color: Colors.lightBlue,
        onPressed: () {

          Navigator.push(
              context,
              MaterialPageRoute(
                  fullscreenDialog: true, builder: (BuildContext context) => Page1()));

        },
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13.0),
        ),
      ),
    ),
    ]
    ));
  }
}



class CustomLogo extends StatelessWidget {
  final double size;
  final String chica;

  CustomLogo({this.size = 200.0,this.chica});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.lightBlueAccent,
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
          "fotos/$chica",
          width: size,
          height: size,
        ),
      ),
    );
  }
}
