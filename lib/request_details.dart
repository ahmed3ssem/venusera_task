import 'package:flutter/material.dart';
import 'package:venusera_task/model/request_item.dart';
import 'package:venusera_task/resource/request_provider.dart';
import 'package:venusera_task/style.dart';
import 'helper/image_widget.dart';
import 'helper/text_widget.dart';
import 'model/request_list_item.dart';
class RequestDetails extends StatefulWidget {

  final int id;
  RequestDetails({this.id});
  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}
class _RequestDetailsState extends State<RequestDetails> {

/*  static SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;
  //Return String
  String Token = prefs.getString('Token');*/
  RequestAPIProvider requestAPIProvider=new RequestAPIProvider();
  List<String> listOfComment;
  @override void initState() {
    // TODO: implement initState
    super.initState();
    listOfComment=new List<String>();
    listOfComment.add("comment1");
    listOfComment.add("comment2");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Request Detials"),
          centerTitle: true,
        ),
        body:
          FutureBuilder<OneRequestItemModel>(
    future:requestAPIProvider.fetchRequestByRequestId(widget.id),
    builder: (context, snapshot) {
      Widget _makeListTile(BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  snapshot.data.result.commentList[index].comment,
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
      Widget buildGridView() {
        return GridView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.result.images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,),
            itemBuilder: (context, index) {
              return ImageWidget.networkImageCircleWidget(
                  snapshot.data.result.images[index].url, 50, 50);
            }
        );
      }
      if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
       return Column(children: [
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
                  snapshot.data.result.name,
                  Styles.headerLarge),
              TextWidget.textWidgetStyle(
                  snapshot.data.result.data,
                  Styles.headerLarge),
              TextWidget.textWidgetStyle(
                  snapshot.data.result.description,
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
                      itemCount: snapshot.data.result.commentList.length,
                      itemBuilder: _makeCard))),
        ]);}));
  }
}
