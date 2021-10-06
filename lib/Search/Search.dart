import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Model/listOfProfiles.dart';
import 'package:flutter_app/Model/profileModel.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_app/Secret.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  NetworkHandler networkHandler = NetworkHandler();
  final _debouncer = Debouncer(milliseconds: 500);
  Widget appBarTitle = new Text("AppBar Title");
  Icon actionIcon = new Icon(Icons.search);
  listOfProfiles profilelist = listOfProfiles();
  ProfileModel profileModel = ProfileModel();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title:appBarTitle,
          actions: <Widget>[
            new IconButton(icon: actionIcon,onPressed:(){
              setState(() {
                if ( this.actionIcon.icon == Icons.search){
                  this.actionIcon = new Icon(Icons.close);
                  this.appBarTitle = new TextField(
                    onChanged: (text){
                      _debouncer.run(() async{
                        var response = await networkHandler.get(search+"$text");
                      setState(() {
                        profilelist = listOfProfiles.fromJson(response);
                      });
                      });
                    },
                    style: new TextStyle(
                      color: Colors.white,

                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search,color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)
                    ),
                  );}
                else {
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle = new Text("AppBar Title");
                }


              });
            } ,),]
      ),
      body: profilelist.data == null ? Center(
        child: Text("No user with that name"),
      ) : ListView.builder(itemBuilder: (context,index){
        return
          InkWell(

            child: Container(
              height: 150,
              padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
              width: MediaQuery.of(context).size.width,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(
                        height: 110,
                        width: 100,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkHandler().getImage(profilelist.data[index].username),
                                  fit: BoxFit.contain),
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            //productname (),
                            Text(
                              profilelist.data[index].username,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );

      },
        itemCount: profilelist.data == null ? 0 : profilelist.data.length,
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}