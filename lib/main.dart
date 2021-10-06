import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/SignInPage.dart';
import 'package:flutter_app/Home/Home_Page.dart';
import 'package:flutter_app/ImageGallery_1.dart';
import 'package:flutter_app/Navigation_bar.dart';
import 'package:flutter_app/Profile/AddShedule.dart';
import 'package:flutter_app/Profile/CreateProfile.dart';
import 'package:flutter_app/Profile/MainProfile.dart';
import 'package:flutter_app/Profile/ProfileScreen.dart';
import 'package:flutter_app/Authentication//SignUpPage.dart';
import 'package:flutter_app/Testing.dart';
import 'package:flutter_app/WelcomeScreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget page = CircularProgressIndicator();
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        page = Navigation_menu();
      });
    } else {
      setState(() {
        page = WelcomeScreen();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoptree Partner',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Center(child: page),
    );
  }
}
