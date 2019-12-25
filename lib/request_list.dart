import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venusera_task/request.dart';
import 'package:venusera_task/request_details.dart';
import 'package:venusera_task/signup.dart';
import 'package:venusera_task/style.dart';

import 'helper/image_widget.dart';

class RequestList extends StatefulWidget {
  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Requests"),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: _makeCard)),
          ButtonTheme(
            //elevation: 4,
            //color: Colors.green,
            minWidth: 70,
            child: MaterialButton(
              onPressed: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Request()))
              },
              textColor: Colors.white,
              color: Colors.blue,
              height: 40,
              child: Text("Add Requset"),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              minWidth: 100,
            ),
          ),
        ]));
  }

  Widget _makeCard(BuildContext context, int index) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white70),
        child: _makeListTile(context, index),
      ),
    );
  }

  Widget _makeListTile(BuildContext context, int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Requestequest",
              style: Styles.headerLarge,
            ),
          ]),
      trailing: Container(
          padding: EdgeInsets.only(left: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child:
              Icon(Icons.keyboard_arrow_right, color: Colors.blue, size: 30.0)),
      leading: ImageWidget.networkImageCircleWidget(
          "http://placehold.it/120x120&text=image1", 50, 50),
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (_) => new RequestDetails(id: "1", name: "request name"),
            maintainState: true));
      },
    );
  }
}
