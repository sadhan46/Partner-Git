import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageGallery_1 extends StatefulWidget {
  @override
  _ImageGallery_1State createState() => _ImageGallery_1State();
}

class _ImageGallery_1State extends State<ImageGallery_1> {
  var image;
  List imageArray = [];

  _openGallery() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    imageArray.add(image);
    setState(() {
      imageArray;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Grid View"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                  child: FlatButton(
                      onPressed: () {
                        _openGallery();
                      },
                      splashColor: Colors.blueAccent,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Center(
                        child: Text("Open Gallery"),
                      ))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .8,
              // decoration: BoxDecoration(border: Border.all(width: 2)),
              padding: EdgeInsets.all(5),
              child: imageArray.isEmpty
                  ? Center(child: Text("No Image"))
                  : GridView.count(
                crossAxisCount: 2,
                children: List.generate(imageArray.length, (index) {
                  var img = imageArray[index];
                  return Container(child: Image.file(img));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}