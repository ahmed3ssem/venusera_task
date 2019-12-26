import 'package:flutter/material.dart';
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

/*  static SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;
  //Return String
  String Token = prefs.getString('Token');*/


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
