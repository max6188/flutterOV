import 'package:flutter/material.dart';
import 'package:pracscrollejem/main.dart';
import 'package:pracscrollejem/scroll_controller/scroll_limit_reached.dart';
import 'package:pracscrollejem/scroll_controller/scroll_movement.dart';
import 'package:pracscrollejem/scroll_controller/scroll_status.dart';

class MainScrollController extends StatelessWidget {
  onButtonTap(Widget page, BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController / ScrollNotifiation"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            MyMenuButton(
              title: "Scroll Limit Reached",
              actionTap: () {
                onButtonTap(ScrollLimitReached(), context);
              },
            ),
            MyMenuButton(
              title: "Scroll Movement",
              actionTap: () {
                onButtonTap(ScrollMovement(), context);
              },
            ),
            MyMenuButton(
              title: "Scroll Status",
              actionTap: () {
                onButtonTap(ScrollStatus(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
