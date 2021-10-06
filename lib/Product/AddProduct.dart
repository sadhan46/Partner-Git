import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_app/Custom/currency.dart';
import 'package:flutter_app/Model/addproductmodel.dart';
import 'package:flutter_app/Navigation_bar.dart';
import 'package:flutter_app/widget/product%20_card.dart';
import 'package:intl/intl.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ImageGallery_1.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app/Home/Home_Page.dart';
//import '../pages';
import 'dart:io';

class AddProduct extends StatefulWidget {
  AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _productname = TextEditingController();
  TextEditingController _productdetails = TextEditingController();
  TextEditingController _mrp = TextEditingController();
  TextEditingController _sp = TextEditingController(text: "");
  TextEditingController _per = TextEditingController();
  TextEditingController _quantity = TextEditingController();

  var f = new NumberFormat("###.0#", "en_US");
  ImagePicker _picker = ImagePicker();
  PickedFile _imageFile1;
  PickedFile _imageFile2;
  PickedFile _imageFile3;
  PickedFile _imageFile4;
  PickedFile _imageFile5;
  PickedFile _imageFile6;
  var _currency = ['\₹', '\$', '\£','\€'];
  var _unit = ['piece', 'Kg', 'gram','liter'];


  var _CurrencySelected = '';
  var _UnitSelected = '';

  NetworkHandler networkHandler = NetworkHandler();


  @override
  void initState() {
    super.initState();
    _CurrencySelected = _currency[0];
    _UnitSelected = _unit[0];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              if (_imageFile1.path != null &&
                  _globalkey.currentState.validate()) {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => Product_Card(
                    imagefile: _imageFile1,
                    productname: _productname.text,
                    currency: _CurrencySelected ,
                    mrp: _mrp.text,
                    sp: _sp.text,
                    quantity: _quantity.text,
                    unit: _UnitSelected,
                    productdetails: _productdetails.text,

                  )),
                );

              }
            },
            child: Text(
              "Preview",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        ],

      ),
      body: Form(
        key: _globalkey,
        child: ListView(
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon( Icons.camera_alt),
                      Text("  Pictures")
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 170,
                    width: 180,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),

                            )),
                        child: _imageFile1 == null
                            ?  Icon(Icons.add)
                            : Semantics(
                          child: Image.file(File(_imageFile1.path)),
                        ),
                      ),
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet1()),
                        );
                      },
                    ),
                  ),

                  /*
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing:10 ,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet1()),
                          );
                        },
                        child: Container(
                          color: Colors.black12,
                          child: _imageFile1 == null
                              ?  Icon(Icons.add)
                              : Semantics(
                              child: Image.file(File(_imageFile1.path)),
                          ),
                        ),
                      ),
                      GestureDetector(

                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet2()),
                          );
                        },
                        child: Container(
                          color: Colors.black12,
                          child: _imageFile2 == null
                              ?  Icon(Icons.add)
                              : Semantics(
                            child: Image.file(File(_imageFile2.path)),
                          ),
                        ),

                      ),
                      GestureDetector(

                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet3()),
                          );
                        },
                        child: Container(
                          color: Colors.black12,
                          child: _imageFile3 == null
                              ?  Icon(Icons.add)
                              : Semantics(
                            child: Image.file(File(_imageFile3.path)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet4()),
                          );
                        },
                        child: Container(
                          color: Colors.black12,
                          child: _imageFile4 == null
                              ?  Icon(Icons.add)
                              : Semantics(
                            child: Image.file(File(_imageFile4.path)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet5()),
                          );
                        },
                        child: Container(
                          color: Colors.black12,
                          child: _imageFile5 == null
                              ?  Icon(Icons.add)
                              : Semantics(
                            child: Image.file(File(_imageFile5.path)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet6()),
                          );
                        },
                        child: Container(
                          color: Colors.black12,
                          child: _imageFile6 == null
                              ?  Icon(Icons.add)
                              : Semantics(
                            child: Image.file(File(_imageFile6.path)),
                          ),
                        ),
                      ),

                    ],

                  )*/
                ],

              ),

            ),

            productnameTextField(),
            Row(
              children: [

                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 11, 8, 0),
                    child: Container(
                      width: 40,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                         // labelText: "currencie",
                        ),
                        items: _currency.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                        value: _CurrencySelected,
                        onChanged: (String newValueSelected) {
                          // Your code to execute, when a menu item is selected from dropdown
                          _onDropDownItemSelected(newValueSelected);
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(child: mrpTextField()),
                Flexible(child: spTextField()),
              ],
            ),
            Row(
              children: [
                Flexible(child: quantityTextField()),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 13),

                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Unit",
                        ),
                        items: _unit.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _UnitSelected,
                        onChanged: (String newValueSelected) {
                          // Your code to execute, when a menu item is selected from dropdown
                          _onDropDownUnitSelected(newValueSelected);
                        },
                      ),
                    )),
              ],
            ),


            productdetailsTextField(),
            SizedBox(
              height: 20,
            ),
            addButton(),
          ],
        ),
      ),
    );
  }



  Widget bottomSheet1() {
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
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto1(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto1(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  Widget bottomSheet2() {
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
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto2(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto2(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
  Widget bottomSheet3() {
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
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto3(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto3(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  Widget bottomSheet4() {
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
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto4(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto4(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  Widget bottomSheet5() {
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
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto5(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto5(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  Widget bottomSheet6() {
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
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto6(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto6(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }


  void takePhoto1(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile1 = pickedFile;
    });
  }
  void takePhoto2(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile2 = pickedFile;
    });
  }
  void takePhoto3(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile3 = pickedFile;
    });
  }
  void takePhoto4(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile4 = pickedFile;
    });
  }
  void takePhoto5(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile5 = pickedFile;
    });
  }
  void takePhoto6(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile6 = pickedFile;
    });
  }



  Widget productnameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(

        controller: _productname,
        validator: (value) {
          if (value.isEmpty) {
            return "Provide product Name";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Product name",
        ),
        maxLines: null,

      ),
    );
  }

  Widget productdetailsTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        controller: _productdetails,
        decoration: InputDecoration(
          labelText: "Product details",
        ),
        maxLines: null,
      ),
    );
  }

  Widget mrpTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9\.]")),
          CurrencyFormat()
        ],
        controller: _mrp,
        validator: (value) {
          if (value.isEmpty) {
            return "Enter MRP";
          }else if (value.length > 7) {
            return "Enter less than 1000000";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Enter MRP",
        ),
        maxLines: null,
      ),
    );
  }


  Widget spTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9\.]")),
          CurrencyFormat()
        ],
        controller: _sp,
        validator: (value) {

          if (value.length > 7) {
            return "Enter less than 1000000";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Selling Price",
        ),
        maxLines: null,
      ),
    );
  }



  Widget perTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9\.]")),
        ],
        controller: _per,/*
        validator: (value) {
          if (value.isEmpty) {
            return "1";
          }
          return null;
        },*/
        initialValue: "1",
        decoration: InputDecoration(
          labelText: "1",
        ),
        maxLines: null,
      ),
    );
  }

  Widget quantityTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9\.]")),
          CurrencyFormat()
        ],
        controller: _quantity,
        validator: (value) {
          if (value.length > 7) {
            return "Enter less than 1000000";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Quantity",
        ),
        maxLines: null,
      ),
    );
  }


  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._CurrencySelected = newValueSelected;
    });
  }

  void _onDropDownUnitSelected(String newValueSelected) {
    setState(() {
      this._UnitSelected = newValueSelected;
    });
  }

  Widget addButton() {
    return InkWell(
      onTap: ()  async{
        print( _mrp.text.replaceAll(",", ""));
        print(_CurrencySelected);
        print(_UnitSelected);
        print(_sp.text);
        if (_imageFile1 != null && _globalkey.currentState.validate())

      {
        Addproductmodel addproductmodel =Addproductmodel(
          product_name: _productname.text,
          currency: _CurrencySelected ,
          mrp: _mrp.text,
          sp: _sp.text,
          quantity: _quantity.text,
          unit: _UnitSelected,
          product_details: _productdetails.text,
        );

        var response = await networkHandler.post1(
            "/add_product/Add", addproductmodel.toJson());
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          String id = json.decode(response.body)["data"];
          var imageResponse = await networkHandler.patchImage(
              "/add_product/add/productImage/$id", _imageFile1.path);
          if (imageResponse.statusCode == 200 ||
              imageResponse.statusCode == 201) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Navigation_menu()),
                    (route) => false);
          }
        }

      }

      },
      child: Center(
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
          child: Center(
              child: Text(
                "Add Product",
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }

}