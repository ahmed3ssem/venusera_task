import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venusera_task/request_comments.dart';
import 'package:venusera_task/style.dart';

import 'helper/image_widget.dart';


class ServiceProviderList extends StatefulWidget {
  @override
  _ServiceProviderListState createState() => _ServiceProviderListState();
}

class _ServiceProviderListState extends State<ServiceProviderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("Requests"),
          centerTitle: true,
        ),
        body:Column(
            children:[
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: _makeCard
                  )
              ),
            ])
    );

  }
  Widget _makeCard(BuildContext context, int index) {
    return Card(
      elevation: 8.0,
      margin:
      new EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(color:Colors.white70),
        child: _makeListTile(context, index),
      ),
    );
  }
  Widget _makeListTile(BuildContext context, int index) {
    return ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "request",
              style:Styles.headerLarge,
            ),
            Text(
              'request descreption',
              style:Styles.defualtText,
            ),
          ]),
      trailing: Container(
          padding: EdgeInsets.only(left: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(
                      width: 1.0, color: Colors.white24))),
          child:
          Icon(Icons.add_comment,
              color: Colors.blue, size: 30.0)
      ),
      leading:
      ImageWidget.networkImageCircleWidget("http://placehold.it/120x120&text=image1", 50, 50),
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(
             builder: (_) => new RequestComments(id: "1", name: "request name"),
              maintainState: true));
        }
    );
  }
}