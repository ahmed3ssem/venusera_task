import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:venusera_task/helper/text_widget.dart';
import 'package:venusera_task/login.dart';
import 'package:venusera_task/request.dart';
import 'package:venusera_task/request_details.dart';
import 'package:venusera_task/request_list.dart';
import 'package:venusera_task/resource/request_provider.dart';
import 'package:venusera_task/signup.dart';
import 'package:venusera_task/style.dart';
import 'helper/image_widget.dart';
import 'model/request_item.dart';

class RequestComments extends StatefulWidget {
  final int id;
  RequestComments({this.id});
  @override
  _RequestCommentsState createState() => _RequestCommentsState();

}

class _RequestCommentsState extends State<RequestComments> {
  RequestAPIProvider requestAPIProvider=new RequestAPIProvider();
  static TextEditingController CommentController = TextEditingController();
  int ServiceProviderID , Requestid;
  String Token;
  List<String> listOfComment;
  @override void initState() {
    // TODO: implement initState
    super.initState();
    listOfComment=new List<String>();
  }

  Future<void> AddCommentApi()
  async {
    //FocusScope.of(context).requestFocus(FocusNode());
    var dio = Dio();
    Response response = await dio.post("http://myousif-001-site1.dtempurl.com/api/requests/"+RequestList.id.toString()+"/comments", data: {"ServiceProviderID": UserLogin.ID, "Comment": CommentController.text,"RequestID" : RequestList.id},options: Options(
      headers: {
        "Authorization": "Bearer "+UserLogin.Token},
      followRedirects: false,
      validateStatus: (status) {
        return status < 500;
      },),
    );
    Map<String, dynamic> user = jsonDecode(response.toString());
    if(user['statusCode']==200)
    {
      print("refresh data in list");
      //_insertComment();
      setState(() {});
    }
    else
    {
      Fluttertoast.showToast(
          msg: "OOPS!! Server Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add comment"),
          centerTitle: true,
        ),
        body:FutureBuilder<OneRequestItemModel>(
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
                new Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10.0),
                    child: new Directionality(
                      textDirection: TextDirection.ltr,
                      child: new TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: CommentController,
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
                    onPressed:AddCommentApi,
                    textColor: Colors.white,
                    color: Colors.blue,
                    height: 40,
                    child: Text("Add Comment"),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    minWidth: 100,
                  ),
                ),
              ]);}));
  }
  void _insertComment() {
    setState(() {
      listOfComment = List.from(listOfComment)
        ..add(CommentController.text);
    });
    FocusScope.of(context).requestFocus(FocusNode());
  }
}