import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Navigation_bar.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_app/Secret.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatefulWidget {
  final PickedFile imagefile;
  const ProfilePicture({Key key,this.imagefile}) : super(key: key);

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(widget.imagefile.path)),
              )
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Row(

            children: [
              MaterialButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel",
                    style: TextStyle(
                        color:  Colors.white,
                    )),
                minWidth: MediaQuery.of(context).size.width * 0.5,
                color: Colors.black,
              ),
              MaterialButton(
                  color: Colors.black,
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  onPressed: () async{
                    if (widget.imagefile.path != null) {
                      var imageResponse = await networkHandler.patchImage(
                          addImage , widget.imagefile.path);
                        if (imageResponse.statusCode == 200) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Navigation_menu(),
                            ),
                            (route) => false);
                      }
                        else{
                          print("did not post");
                        }
                    }
                  },
                  child: Text("Update",
                      style: TextStyle(
                          color:  Colors.white,
                      ))),

            ],
          ),
        )

      ],
    );
  }
}
