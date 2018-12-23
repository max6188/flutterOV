import 'package:flutter/material.dart';
class ThreeRowTile extends StatelessWidget {
  final Widget title;
  final Widget detail;
  final String utility1;
  final String utility1Help;
  final String utility2Help;
  final String utility2;
  final Icon icon;
  final String cell;
  final String home;
  final String office;
  final String email;
  final VoidCallback cellTapped;
  final VoidCallback cellLongPressed;
  final VoidCallback iconTapped;

  ThreeRowTile({
    this.title,
    this.icon,
    this.detail,
    this.utility1,
    this.utility1Help,
    this.utility2,
    this.utility2Help,
    this.cellTapped,
    this.home,
    this.email,
    this.cell,
    this.office,
    this.cellLongPressed,
    this.iconTapped,
  });

  @override
  Widget build(BuildContext context) {
    double miTextScaleFactor=15.0;
    List<Widget> buildChildren() {
      List<Widget> builder = [];
      if (cell.isNotEmpty && !cell.toString().contains("--")) {
        builder.add(ListTile(
          leading: const Icon(Icons.phone),
          title: Text(
            'Cell',
            textScaleFactor: miTextScaleFactor,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            cell.toString().length > 0 ? cell : "No Number Found",
            textScaleFactor: miTextScaleFactor,
          ),
          onTap: cell.toString().contains("--")
              ? null
              : () {
            //globals.Utility.makePhoneCall(context, cell);
          },
        ));
      }

      if (office.isNotEmpty && !office.toString().contains("--")) {
        builder.add(ListTile(
          leading: const Icon(Icons.work),
          title: Text(
            'Office',
            textScaleFactor: miTextScaleFactor,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            office.toString().length > 0 ? office : "No Number Found",
            textScaleFactor: miTextScaleFactor,
          ),
          onTap: office.toString().contains("--")
              ? null
              : () {
            globals.Utility.makePhoneCall(context, office);
          },
        ));
      }
      if (home.isNotEmpty && !home.toString().contains("--")) {
        builder.add(ListTile(
          leading: const Icon(Icons.home),
          title: Text(
            'Home',
            textScaleFactor: miTextScaleFactor,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            home.toString().length > 0 ? home : "No Number Found",
            textScaleFactor: miTextScaleFactor,
          ),
          onTap: home.toString().contains("--")
              ? null
              : () {
            //globals.Utility.makePhoneCall(context, home);
          },
        ));
      }
      if (email.isNotEmpty && !email.contains('No Email Address')) {
        builder.add(ListTile(
          leading: const Icon(Icons.email),
          title: Text(
            'Email',
            textScaleFactor: miTextScaleFactor,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            email.toString().length > 0 ? email : "No Email Found",
            textScaleFactor: miTextScaleFactor,
          ),
          onTap: email.toString().isEmpty
              ? null
              : () {
            //globals.Utility.sendEmail(context, email);
          },
        ));
      }
      if (builder.isEmpty) {
        builder.add(
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(
              'No Contact Information Found',
              textScaleFactor: miTextScaleFactor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      return builder;
    }

    String _utility1 =
    utility1 == null || utility1.contains("1-1-1800") ? "" : utility1;
    String _utility2 =
    utility2 == null || utility2.contains("1-1-1800") ? "" : utility2;

    var rowCard = Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Align(
                  child: IconButton(
                    icon: icon,
                    onPressed: iconTapped,
                  ),
                  alignment: FractionalOffset.centerLeft,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      new Align(
                        child: title, //so big text
                        alignment: FractionalOffset.topLeft,
                      ),
                      // new Divider(),
                      new Align(
                        child: detail,
                        alignment: FractionalOffset.topLeft,
                      ),
                      // new Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(3.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: _utility1.length > 1
                                          ? Colors.grey
                                          : Colors.transparent)),
                              child: Tooltip(
                                message:
                                utility1Help == null ? "" : utility1Help,
                                child: Text(
                                  _utility1,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  textScaleFactor: miTextScaleFactor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(3.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: _utility2.length > 1
                                          ? Colors.grey
                                          : Colors.transparent)),
                              child: Tooltip(
                                message: utility2 == null ? "" : utility2,
                                child: Text(
                                  _utility2,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  textScaleFactor: miTextScaleFactor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  child: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: buildChildren()),
                                  ),
                                ));
                          });
                    },
                  ),
                  alignment: FractionalOffset.centerRight,
                ),
              ],
            ),
          ],
        ),
      ),
      // color: globals.isDarkTheme ? Colors.black45 : Colors.white,
    );

    return (rowCard);
  }
}