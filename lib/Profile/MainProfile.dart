import 'dart:io';

import 'package:flutter_app/Model/profileModel.dart';
import 'package:flutter_app/Navigation_bar.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/AddShedule.dart';
import 'package:flutter_app/Profile/CheckSchedule.dart';
import 'package:flutter_app/Profile/ProfilePicture.dart';
import 'package:flutter_app/Secret.dart';
import 'package:flutter_app/WelcomeScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainProfile extends StatefulWidget {
  MainProfile({Key key}) : super(key: key);

  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  bool circular = true;
  PickedFile _imageFile;
  NetworkHandler networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel();
  final storage = FlutterSecureStorage();


  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> editAddress(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          final TextEditingController _address = TextEditingController();
          return StatefulBuilder(builder: (context,setState){
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              titlePadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              title: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),],
                  shape: BoxShape.rectangle,
                  color: Color(0xff1C396D),
                  borderRadius:
                  new BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                ),
                height: 50,
                child: Center(
                  child: Text(
                    "Address"
                  )
                ),
              ),
              content: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _address,
                    validator: (value){
                      if (value.isEmpty) return "Address can't be empty";
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Enter Address"),
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Save'),
                  onPressed: () async{
                      if (_formKey.currentState.validate()) {
                      Map<String, String> data = {
                        "address": _address.text,
                      };
                      var response =
                          await networkHandler.patch(updateProfile, data);
                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        setState(() {
                          circular = false;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Navigation_menu(),),
                                (route) => false);
                      }
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get(getProfile);
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C396D).withOpacity(0.05),
      appBar: AppBar(
        title:Image.asset('assets/shoptree_admin.png',height: 40),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff1C396D),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        //   color: Colors.black,
        // ),
      ),
      body: circular
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                head(),
                businessdetails(),
                otherDetails("Address", profileModel.address),
                /*Divider(
                  thickness: 0.8,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  /*  ListTile(
                      title: Text(
                          "Opening Time: ${openingtime.hour}:${openingtime.minute}"),
                      trailing: Icon(Icons.add),
                      onTap: () async {
                        TimeOfDay o = await showTimePicker(
                            context: context, initialTime: openingtime);
                        if (o != null)
                          setState(() {
                            openingtime = o;
                          });
                      },
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        //break1
                        ListTile(
                          title: Row(
                            children: [
                              Text("Break 1:-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b1f = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b1f != null)
                                      setState(() {
                                        break_1_from = b1f;
                                      });
                                  },
                                  child: Text(break_1_from == null
                                      ? "NA"
                                      : "${break_1_from.hour}:${break_1_from.minute}")),
                              Text("-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b1t = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b1t != null)
                                      setState(() {
                                        break_1_to = b1t;
                                      });
                                  },
                                  child: Text(break_1_to == null
                                      ? "NA"
                                      : "${break_1_to.hour}:${break_1_to.minute}")),
                            ],
                          ),
                        ),
                        // break 2
                        ListTile(
                          title: Row(
                            children: [
                              Text("Break 2:-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b2f = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b2f != null)
                                      setState(() {
                                        break_2_from = b2f;
                                      });
                                  },
                                  child: Text(break_2_from == null
                                      ? "NA"
                                      : "${break_2_from.hour}:${break_2_from.minute}")),
                              Text("-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b2t = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b2t != null)
                                      setState(() {
                                        break_2_to = b2t;
                                      });
                                  },
                                  child: Text(break_2_to == null
                                      ? "NA"
                                      : "${break_2_to.hour}:${break_2_to.minute}")),
                            ],
                          ),
                        ),
                        //break 3
                        ListTile(
                          title: Row(
                            children: [
                              Text("Break 3:-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b3f = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b3f != null)
                                      setState(() {
                                        break_3_from = b3f;
                                      });
                                  },
                                  child: Text(break_3_from == null
                                      ? "NA"
                                      : "${break_3_from.hour}:${break_3_from.minute}")),
                              Text("-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b3t = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b3t != null)
                                      setState(() {
                                        break_3_to = b3t;
                                      });
                                  },
                                  child: Text(break_3_to == null
                                      ? "NA"
                                      : "${break_3_to.hour}:${break_3_to.minute}")),
                            ],
                          ),
                        ),
                        //break 4
                        ListTile(
                          title: Row(
                            children: [
                              Text("Break 4:-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b4f = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b4f != null)
                                      setState(() {
                                        break_4_from = b4f;
                                      });
                                  },
                                  child: Text(break_4_from == null
                                      ? "NA"
                                      : "${break_4_from.hour}:${break_4_from.minute}")),
                              Text("-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b4t = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b4t != null)
                                      setState(() {
                                        break_4_to = b4t;
                                      });
                                  },
                                  child: Text(break_4_to == null
                                      ? "NA"
                                      : "${break_4_to.hour}:${break_4_to.minute}")),
                            ],
                          ),
                        ),
                        //break 5
                        ListTile(
                          title: Row(
                            children: [
                              Text("Break 5:-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b5f = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b5f != null)
                                      setState(() {
                                        break_5_from = b5f;
                                      });
                                  },
                                  child: Text(break_5_from == null
                                      ? "NA"
                                      : "${break_5_from.hour}:${break_5_from.minute}")),
                              Text("-"),
                              TextButton(
                                  onPressed: () async {
                                    TimeOfDay b5t = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                    if (b5t != null)
                                      setState(() {
                                        break_5_to = b5t;
                                      });
                                  },
                                  child: Text(break_5_to == null
                                      ? "NA"
                                      : "${break_5_to.hour}:${break_5_to.minute}")),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                          "Closing Time: ${closingtime.hour}:${closingtime.minute}"),
                      trailing: Icon(Icons.add),
                      onTap: () async {
                        TimeOfDay c = await showTimePicker(
                            context: context, initialTime: closingtime);
                        if (c != null)
                          setState(() {
                            closingtime = c;
                          });
                      },
                    ),*/
                    //breakz==0?SizedBox():_Breaks(),
                  ],
                ),*/
                ListTile(
                  title: Text(
                      "Appointment Services"),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.blue,),
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckSchedule()));
//                    await AppointmentDialog(context);
                  },
                ),
                ListTile(
                  title: Text(
                      "Logout"),
                  trailing: Icon(Icons.logout,color: Colors.blue,),
                  onTap: logout,
                ),
              ],
            ),
    );
  }

  Widget head() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: InkWell(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:  NetworkHandler().getImage(profileModel.username),
              ),
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
            ),
          ),
          Center(
            child: Text(
              profileModel.username,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget businessdetails(){
    return
      Column(
        children: [
          Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.125),
                child: Column(
                  children: [
                    Text("Services", style: TextStyle(fontSize: 16,
                        color: Colors.black)),
                    Text(profileModel.services, style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.125),
                child: Column(
                  children: [
                    Text("Total Earnings", style: TextStyle(fontSize: 16,
                        color: Colors.black)),
                    RichText(text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: '₹ ', style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: Colors.black)),
                          TextSpan(text: profileModel.total,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black)),
                        ]
                    )),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30.0),
              child: Container(
                height: 2,
                color: Color(0xff1C396D).withOpacity(0.05),
              ),
          ),
          Column(
            children: [
              Text("Total Service Time", style: TextStyle(fontSize: 16,
                  color: Colors.black)),
              RichText(text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: profileModel.service_time.split(":")[0], style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.black)),
                    TextSpan(text: 'Hrs ',style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.w600,color: Colors.black)),
                    TextSpan(text: profileModel.service_time.split(":")[1], style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.black)),
                    TextSpan(text: 'mins',style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.w600,color: Colors.black)),
                  ]
              )),
            ],
          ),
        ],
      );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
      imageQuality: 10,
    );
    setState(() {
      _imageFile = pickedFile;

    });

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProfilePicture(
          imagefile: _imageFile,
        )));

  }

  Widget otherDetails(String label, String value) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.place),
      title: Text("$label :"),
      subtitle: Text(value),
      trailing: InkWell(child: Icon(Icons.edit),
          onTap: (){
        editAddress(context);
          },
      ),
    );
  }

  void logout() async {
    await storage.delete(key: "token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
            (route) => false);
  }
}
