import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  static TextEditingController RequestEditingContrller = TextEditingController();
  static TextEditingController RequestDateEditingContrller = TextEditingController();
  static TextEditingController RequestDescriptionEditingContrller = TextEditingController();

  static String  Request = RequestEditingContrller.toString();
  static String  RequestDate  = RequestDateEditingContrller.toString();
  static String  RequestDescription  = RequestDescriptionEditingContrller.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Request"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(14),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    controller: RequestEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Request",
                        hintText: "Request",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.green,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.datetime,
                    controller:RequestDateEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Request Date",
                        hintText: "Request Date",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.green,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: RequestDescriptionEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Request Description",
                        hintText: "Request Description",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.green,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonTheme(
                    //elevation: 4,
                    //color: Colors.green,
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: () => {},
                      textColor: Colors.white,
                      color: Colors.blue,
                      height: 40,
                      child: Text("Add Request"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}