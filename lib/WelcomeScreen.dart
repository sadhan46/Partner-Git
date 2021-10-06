import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/SignInPage.dart';
import 'package:flutter_app/Authentication/SignUpPage.dart';
import 'package:flutter_app/Navigation_bar.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sawo/sawo.dart';

class WelcomeScreen extends StatefulWidget {
  //const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  NetworkHandler networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool action = true ;
  bool loading = false ;


  // Sawo configuration object
  var config = {};
  // user payload
  String user;
  //String abc = '{"identifier":"null"}';
  User xyz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C396D),
      body: loading?Center(child: CircularProgressIndicator()):SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*Text("BackSlash Flutter provides extraordinary flutter tutorials. Do Subscribe! ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,

                    ),)*/
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Shoptree_Customer.png")
                    )
                ),
              ),

              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    color: Colors.white,
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async{
                        await Sawo(
                          apiKey: "08eba12a-8818-42d1-823c-eaa927c3aa60",
                          secretKey:
                              "60bdf55a5e448a13d64a67d7nO6G0yHIZoYaWCAPbvQXT4CQ",
                        ).signIn(
                          context: context,
                          identifierType: 'phone_number_sms',
                          callback: payloadCallback,
                        );
/*
                      //Login Logic start here
                      Map<String, String> data = {
                        "mobile_number": xyz.identifier,
                      };
                      var response =
                          await networkHandler.post("/user/login", data);

                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        Map<String, dynamic> output = json.decode(response.body);
                        print(output["token"]);
                        await storage.write(key: "token", value: output["token"]);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Navigation_menu(),
                            ),
                                (route) => false);
                      } else {
                        print('0');
                        print('failed......!!!!!!!');
                        String output = json.decode(response.body);
                        print(output);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(output)));
                      }
*/
                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0xff1C396D)
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color:  Color(0xff1C396D),
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                    },
                    color: Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  )

                ],
              )



            ],
          ),
        ),
      ),
    );
  }

  void payloadCallback(context, payload) async{

    //action=false;

    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login failed")));
    }
    else {
      setState(() {
        user = payload;
        xyz = User.fromJson(jsonDecode(user));
      });
      loading = true ;
      //Login Logic start here
      Map<String, String> data = {
        "mobile_number": xyz.identifier,
      };
      var response = await networkHandler.post("/profile/login", data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> output = json.decode(response.body);
        print(output["token"]);
        await storage.write(key: "token", value: output["token"]);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Navigation_menu(),
            ),
            (route) => false);
      }
      else {
        print('0');
        print('failed......!!!!!!!');
        action == true;
        String output = json.decode(response.body);
        print(output);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(output)));
      }
    }
  }
}

class User{
  String identifier;
  User(this.identifier);

  factory User.fromJson(dynamic json){
    return User(json['identifier'] as String);
  }

  @override
  String toString(){
    return '{${this.identifier}}';
  }

}