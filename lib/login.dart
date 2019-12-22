import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController emailEditingContrller = TextEditingController();

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
                    controller: emailEditingContrller,
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
                    keyboardType: TextInputType.text,
                    controller: emailEditingContrller,
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
                      onPressed: () => {},
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signup()))
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