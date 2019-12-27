import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venusera_task/model/request_list_item.dart';
import 'package:venusera_task/request_comments.dart';
import 'package:venusera_task/request_details.dart';
import 'package:venusera_task/resource/request_provider.dart';
import 'package:venusera_task/style.dart';
import 'helper/image_widget.dart';


class ServiceProviderList extends StatefulWidget {
  @override
  _ServiceProviderListState createState() => _ServiceProviderListState();
  static int id;
}

class _ServiceProviderListState extends State<ServiceProviderList> {

  RequestAPIProvider requestAPIProvider=new RequestAPIProvider();
  Future<RequestItemModel> requestList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestList=requestAPIProvider.fetchRequestList();
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
        snapshot.data.results[index].imageURL, 50, 50),
    onTap: () {
      ServiceProviderList.id = snapshot.data.results[index].id ;
      print(ServiceProviderList.id.toString());
    Navigator.of(context).push(new MaterialPageRoute(
    builder: (_) => new RequestComments(id:index),
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
    ]);})
    );
  }
}
