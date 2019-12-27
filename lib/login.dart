import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venusera_task/request_list.dart';
import 'package:venusera_task/resource/request_provider.dart';
import 'package:venusera_task/service_provider_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:venusera_task/signup.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
  static String Token ;
  static int ID;

  static List<String> RequestName = new List();
  static List<String> RequestID = new List();
  static List<String> RequesImage = new List();
  static List<String> FinalImages = new List();
}

class _UserLoginState extends State<UserLogin> {

  static TextEditingController EmailEditingContrller = TextEditingController();
  static TextEditingController PassEditingContrller = TextEditingController();
  RequestAPIProvider requestAPIProvider=new RequestAPIProvider();


   String Token , UserType;
   int ID;

  void LoginValidate()
  {
    if(!EmailValidator.validate(EmailEditingContrller.text))
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
    else if(EmailEditingContrller.text.isEmpty||PassEditingContrller.text.isEmpty)
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
    else
      {
        LoginApi();
      }
  }

  Future<void> LoginApi()
  async {
    var dio = Dio();
    Response response = await dio.post("http://myousif-001-site1.dtempurl.com/api/users/Authenticate", data: {"email": EmailEditingContrller.text, "password": PassEditingContrller.text},options: Options(
      followRedirects: false,
      validateStatus: (status) {
        return status < 500;
      },),
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
      Token = user['result']['token'];
      ID = user['result']['id'];
      UserLogin.Token = Token;
      UserLogin.ID = ID;
      if(user['result']['userType']=="1")
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestList()));
        }
      else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceProviderList()));
        }
    }
    }

  void convertImage()
  {
    UserLogin.FinalImages.clear();
    var spliting;
    String result;
    for(int i=0;i<UserLogin.RequesImage.length;i++)
    {
      spliting = UserLogin.RequesImage[i].split("~");
      result ="http://myousif-001-site1.dtempurl.com"+spliting[1];
      UserLogin.FinalImages.add(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
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
                    height: 20,
                  ),
                  TextField(
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
                    height: 20,
                  ),
                  ButtonTheme(
                    //elevation: 4,
                    //color: Colors.green,
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: LoginValidate,
                      textColor: Colors.white,
                      color: Colors.blue,
                      height: 40,
                      child: Text("LOGIN"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonTheme(
                    //elevation: 4,
                    //color: Colors.green,
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()))
                      },
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