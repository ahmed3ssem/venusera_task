import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:venusera_task/style.dart';

import 'helper/image_widget.dart';
import 'helper/text_widget.dart';
class RequestDetails extends StatefulWidget {
  final String id;
  final String name;
  RequestDetails({this.id, this.name});
  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}
class _RequestDetailsState extends State<RequestDetails> {

  Widget buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 3,),
      itemBuilder: (context, index) {
        return Card(child:
        Column( children: <Widget>[
          Container(
              width: 150,
              height: 100,
              decoration: new BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius:
                  new BorderRadius.all(const Radius.circular(8.0)),
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.9), BlendMode.dstATop),
                    image: new NetworkImage("http://placehold.it/120x120&text=image1"),
                  ))),
        ],)
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: Text(
            'Request Details',
            style: Styles.headerSmall
        ),
        backgroundColor: Styles.defualtColor,
        iconTheme: new IconThemeData(color: Colors.blue),
      ),
      backgroundColor: Styles.defualtColor,
    body:SingleChildScrollView(
    child:Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
         new Container(
            padding: const EdgeInsets.all(20.0),
           margin: const EdgeInsets.all(20.0),
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
        SizedBox(
          height: 20,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: new Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              color: Colors.blue[200],
              borderRadius:
              BorderRadius.all(Radius.circular(20.0)),
            ),
            child:buildGridView() ,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
    ),
    );
  }
}
