import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venusera_task/model/request_list_item.dart';
import 'package:venusera_task/request.dart';
import 'package:venusera_task/request_details.dart';
import 'package:venusera_task/resource/request_provider.dart';
import 'package:venusera_task/signup.dart';
import 'package:venusera_task/style.dart';

import 'helper/image_widget.dart';

class RequestList extends StatefulWidget {
  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  RequestAPIProvider requestAPIProvider=new RequestAPIProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Requests"),
          centerTitle: true,
        ),
        body:FutureBuilder<RequestItemModel>(
            future:requestAPIProvider.fetchRequestList(),
            builder: (context, snapshot) {
              Widget _makeListTile(BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data.results[index].name,
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
                      snapshot.data.imageList[0].url, 50, 50),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (_) => new RequestDetails(id: snapshot.data.results[index].id),
                        maintainState: true));
                  },
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
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
              return Column(children: [
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.results.length,
                  itemBuilder: _makeCard))

                ,
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
        ]);})
              );
  }
}
