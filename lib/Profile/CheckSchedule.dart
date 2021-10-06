import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_app/Profile/AddShedule.dart';
import 'package:flutter_app/Profile/EditSchedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Secret.dart';

class CheckSchedule extends StatefulWidget {
  CheckSchedule({Key key}) : super(key: key);

  @override
  _CheckScheduleState createState() => _CheckScheduleState();
}

class _CheckScheduleState extends State<CheckSchedule> {
  NetworkHandler networkHandler = NetworkHandler();
  Widget page = CircularProgressIndicator();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkProfile();
  }

  void checkProfile() async {
    var response = await networkHandler.get(checkShedule);
    if (response["status"] == true) {
      setState(() {
        print('EditShedule');
        page = EditSchedule();
      });
    } else {
      setState(() {
        print('AddShedule');
        page = AddShedule();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEFF),
      body: Center(child: page),
    );
  }
}