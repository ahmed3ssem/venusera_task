import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venusera_task/helper/text_widget.dart';
import 'package:venusera_task/request.dart';
import 'package:venusera_task/request_details.dart';
import 'package:venusera_task/signup.dart';
import 'package:venusera_task/style.dart';

import 'helper/image_widget.dart';

class RequestComments extends StatefulWidget {
  final String id;
  final String name;
  RequestComments({this.id, this.name});
  @override
  _RequestCommentsState createState() => _RequestCommentsState();

}

class _RequestCommentsState extends State<RequestComments> {
  List<String> listOfComment;
  static TextEditingController CommentEditingContrller =
  TextEditingController();
  @override void initState() {
    // TODO: implement initState
    super.initState();
    listOfComment=new List<String>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add comment"),
          centerTitle: true,
        ),
        body:Column(children: [
          new Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              color: Colors.blue[200],
              borderRadius:
              BorderRadius.all(Radius.circular(20.0)),
            ),
            child: new Column(children: [
              TextWidget.textWidgetStyle(
                  'request name',
                  Styles.headerLarge),
              TextWidget.textWidgetStyle(
                  'Request date',
                  Styles.headerLarge),
              TextWidget.textWidgetStyle(
                  'sdaf asdfasf asdf asdf sssssssssssssssssssssssssssssssssssssssssssssssf sdfsdf',
                  Styles.headerLarge)
            ]),
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: new Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                color: Colors.blue[200],
                borderRadius:
                BorderRadius.all(Radius.circular(20.0)),
              ),
              child:buildGridView() ,
            ),
          ),
          Expanded(
                  child: SizedBox(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:listOfComment.length,
                  itemBuilder: _makeCard))),
          new Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: new Directionality(
                textDirection: TextDirection.ltr,
                child: new TextFormField(
                  //keyboardType: TextInputType.multiline,
                  //maxLines: null,
                  controller:CommentEditingContrller,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 5.0),
                    ),
                    hintText: 'Comment',
                  ),
                ),
              )),
          ButtonTheme(
            //elevation: 4,
            //color: Colors.green,
            minWidth: 70,
            child: MaterialButton(
              onPressed:_insertComment,
              textColor: Colors.white,
              color: Colors.blue,
              height: 40,
              child: Text("Add Comment"),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              minWidth: 100,
            ),
          ),
        ]));
  }
  void _insertComment() {
    setState(() {
      listOfComment = List.from(listOfComment)
        ..add(CommentEditingContrller.text);
    });
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
              '${listOfComment[index]}',
              style: Styles.headerLarge,
            ),
          ]),
      trailing: Container(
          padding: EdgeInsets.only(left: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child:
          Icon(Icons.comment, color: Colors.blue, size: 30.0)),
      onTap: () {},
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,),
      itemBuilder: (context, index) {
        return ImageWidget.networkImageCircleWidget(
            "http://placehold.it/120x120&text=image1", 50, 50);
      }
        );
  }
}