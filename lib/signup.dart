import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:venusera_task/login.dart';
import 'package:venusera_task/service_provider_list.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static TextEditingController NameEditingContrller = TextEditingController();
  static TextEditingController EmailEditingContrller = TextEditingController();
  static TextEditingController PassEditingContrller = TextEditingController();
  static TextEditingController ConfirmPassEditingContrller = TextEditingController();

  List<String> UserType = ['Client' , 'Service Provider']; // Option 2
  String SelectedType;

  void SignUpValidation()
  {
    if(EmailEditingContrller.text.isEmpty||NameEditingContrller.text.isEmpty||PassEditingContrller.text.isEmpty||ConfirmPassEditingContrller.text.isEmpty||SelectedType==null)
      {
        Fluttertoast.showToast(
            msg: "Please Fill Out All Information",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    else if(!EmailValidator.validate(EmailEditingContrller.text))
      {

        Fluttertoast.showToast(
            msg: "Please Enter validate email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    else if(PassEditingContrller.text!=ConfirmPassEditingContrller.text)
      {
        Fluttertoast.showToast(
            msg: "Password Doesnot Match",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    else if(SelectedType==null)
      {
        Fluttertoast.showToast(
            msg: "Please select usertype",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    else
      {
        SignUpApi();
      }
  }

  Future<void> SignUpApi()
  async {
    var dio = Dio();
    int type;
    if(SelectedType=="Client")
      {
        type = 1;
      }
    else if(SelectedType=="Service Provider")
      {
        type = 2;
      }
    Response response = await dio.post("http://myousif-001-site1.dtempurl.com/api/users/Register", data: {"name": NameEditingContrller.text, "email": EmailEditingContrller.text, "password": PassEditingContrller.text,"userType": type},options: Options(
      followRedirects: false,
      validateStatus: (status) {
        return status < 500;
      },
    ),
    );
    Map<String, dynamic> user = jsonDecode(response.toString());
    if(user['statusCode']!=200)
      {
        Fluttertoast.showToast(
            msg: user['responseException']['exceptionMessage'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    else
      {
        Fluttertoast.showToast(
            msg: "Email registered successfully , Please active your email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLogin()));
      }
  }

   void toJson() {
    Map<String, dynamic> map() =>
        {
          'name': "sdaasd",
          'email': "sdasa",
          'dob': "dsad"
        };
    String result = jsonEncode(map());
    print('['+result+']');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
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
                  TextFormField(
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    controller: NameEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Name",
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
                  TextFormField(
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: EmailEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
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
                  TextFormField(
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: PassEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
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
                  TextFormField(
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: ConfirmPassEditingContrller,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Confirm Password",
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
                  DropdownButton(
                    hint: Text('Please select type'), // Not necessary for Option 1
                    value: SelectedType,
                    onChanged: (newValue) {
                      setState(() {
                        SelectedType = newValue;
                      });
                    },
                    items: UserType.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonTheme(
                    //elevation: 4,
                    //color: Colors.green,
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: toJson,
                      textColor: Colors.white,
                      color: Colors.blue,
                      height: 40,
                      child: Text("SignUp"),
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