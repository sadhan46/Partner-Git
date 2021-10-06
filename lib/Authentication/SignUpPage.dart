import 'dart:convert';
import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter_app/Navigation_bar.dart';
import 'package:flutter_app/Secret.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_app/Navigation_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sawo/sawo.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool vis = true;
  final _globalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  PickedFile _imageFile;
  String mobileNumber;
  String errorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();
  final ImagePicker _picker = ImagePicker();

  // Sawo configuration object
  var config = {};
  // user payload
  String user;
  //String abc = '{"identifier":"null"}';
  User xyz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1C396D), Color(0xff1C396D)],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Form(
          key: _globalkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageProfile(),
              SizedBox(
                height: 20,
              ),
              usernameTextField(),
              addressTextField(),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    circular = true;
                  });
                  await checkUser();

                  if (_globalkey.currentState.validate() && validate) {
                    print("0");
                    await Sawo(
                      apiKey: sawoApiKey,
                      secretKey: sawoSecretKey,
                    ).signIn(
                      context: context,
                      identifierType: 'phone_number_sms',
                      callback: payloadCallback,
                    );
                    print ("1");

                     /* Map<String, String> register = {
                        "username": _usernameController.text,
                        "mobile_number": xyz.identifier,
                      };
                      print(register);
                      var responseRegister = await networkHandler.post(
                          "userRegister", register);
                      //Login Logic added here
                      if (responseRegister.statusCode == 200 ||
                          responseRegister.statusCode == 201) {
                        Map<String, String> login = {
                          "mobile_number": xyz.identifier,
                        };
                        print(login);
                        print("3");
                        var responseLogin =
                            await networkHandler.post("userLogin", login);
                        if (responseLogin.statusCode == 200 ||
                            responseLogin.statusCode == 201) {
                          Map<String, dynamic> output =
                              json.decode(responseLogin.body);
                          print(output["token"]);
                          await storage.write(
                              key: "token", value: output["token"]);*/
                          //setState(() {
                          //validate = true;
                          //circular = false;
                          //});

                          Map<String, String> profile = {
                            "username": _usernameController.text,
                            "address": _addressController.text,
                            "mobile_number": xyz.identifier,
                          };
                          print(profile);
                          print("4");
                          var responseProfile = await networkHandler.post(
                              profileRegister, profile);
                          if (responseProfile.statusCode == 200 ||
                              responseProfile.statusCode == 201) {
                            Map<String, dynamic> output =
                            json.decode(responseProfile.body);
                            print(output["token"]);
                            await storage.write(
                                key: "token", value: output["token"]);
                            if (_imageFile.path != null) {
                              print('5');
                              var imageResponse =
                                  await networkHandler.patchImage(
                                      profileImage, _imageFile.path);
                              if (imageResponse.statusCode == 200) {
                                print('6');
                                setState(() {
                                  validate = true;
                                  circular = false;
                                });
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Navigation_menu(),
                                    ),
                                    (route) => false);
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Registration failed")));
                                circular = false;
                          }
                        /*}
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login failed")));
                        }*/
                      //}
                      //Login Logic added here
                      /* if (responseRegister.statusCode == 200 ||
                        responseRegister.statusCode == 201) {
                      Map<String, String> data = {
                        "mobile_number": mobileNumber,
                      };
                      var response =
                      await networkHandler.post("/user/login", data);

                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        Map<String, dynamic> output =
                        json.decode(response.body);
                        print(output["token"]);
                        await storage.write(
                            key: "token", value: output["token"]);
                        setState(() {
                          validate = true;
                          circular = false;
                        });
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Navigation_menu(),
                            ),
                                (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Netwok Error")));
                      }
                    }
*/
                      //Login Logic end here
                    }/*
                   else {
                    setState(() {
                      //show snackbar registration failed
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registration failed")));
                      circular = false;
                    });
                  }*/
                },
                child: circular ? CircularProgressIndicator()
                    :   Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                        child: Center(
                           child: Text("Verify and Sign In", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  checkUser() async {
    if (_usernameController.text.length == 0) {
      setState(() {
        // circular = false;
        validate = false;
        errorText = "Username Can't be empty";
      });
    } else {
      var response = await networkHandler
          .get(checkUsername+"${_usernameController.text}");
      if (response['Status']) {
        setState(() {
          circular = false;
          validate = false;
          errorText = "Username already taken";
        });
      } else {
        setState(() {
          // circular = false;
          validate = true;
        });
      }
    }
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
      child: Column(
        children: [
          Text("Username",style: TextStyle(color: Colors.white),),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              errorText: validate ? null : errorText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addressTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
      child: Column(
        children: [
          Text("Address",style: TextStyle(color: Colors.white),),
          TextFormField(
            controller: _addressController,
            validator: (value) {
              if (value.isEmpty) return "Address can't be empty";
              return null;
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
      child: Column(
        children: [
          Text("Password"),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value.isEmpty) return "Password can't be empty";
              if (value.length < 8) return "Password length must have >=8";
              return null;
            },
            obscureText: vis,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    vis = !vis;
                  });
                },
              ),
              helperText: "Password length should have >=8",
              helperStyle: TextStyle(
                fontSize: 14,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        _imageFile == null?CircleAvatar(
          radius: 50.0,
          child: Container(//color: Colors.grey,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),),
        ):
        CircleAvatar(
          radius: 50.0,
          backgroundImage: FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.blue,
              size: 28.0,
            ),
          ),
        ),
      ]),
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

  }


  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    }
    setState(() {
      user = payload;
      xyz = User.fromJson(jsonDecode(user));
    });
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