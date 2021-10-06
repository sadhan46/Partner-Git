import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Model/addproductmodel.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:image_picker/image_picker.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key key,this.networkHandler,this.addProductModel/* this.imagefile, this.productname,this.productdetails,this.mrp,this.sp,this.currencie,this.quantity,this.unit*/}) : super(key: key);
  /*final PickedFile imagefile;
  final String productname;
  final String currencie;
  final String mrp;
  final String sp;
  final String quantity;
  final String unit;
  final String productdetails;
*/
  final NetworkHandler networkHandler;
  final Addproductmodel addProductModel;






  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool addproduct ;
  int _counter=1;

  @override
  void initState() {
    super.initState();
    addproduct = false;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          image: NetworkHandler().getImage(Addproductmodel().id),
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
              /*Container(
                height: 120,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(
                        File(imagefile.path),
                      ),
                      fit: BoxFit.fitWidth),
                ),
              ),*/
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    //productname (),
                    Text(
                      Addproductmodel().product_name ,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(

                      padding: const EdgeInsets.only(top: 10),
                      child: Text("${Addproductmodel().quantity} ${Addproductmodel().unit}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width-120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (Addproductmodel().sp != "")
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${Addproductmodel().currency}${Addproductmodel().sp}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: '${Addproductmodel().currency}${Addproductmodel().mrp}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          else
                            Text(
                              "${Addproductmodel().currency}${Addproductmodel().mrp}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          Container(child: addproduct?addmore():add())
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget addButton() {
    return InkWell(
      onTap: ()  { },
      child: Center(
        child: Container(
          height: 20,
          decoration: BoxDecoration(


            borderRadius: BorderRadius.circular(4), color: Colors.blueAccent,


          ),
          child: Center(
              child: Text(
                "ADD +",
                style: TextStyle(
                    color: Colors.white, fontSize: 16),
              )),
        ),
      ),
    );
  }

  Widget spprice(){
    RichText(text:
    TextSpan(children: [

      TextSpan(
        text: '${Addproductmodel().currency}${Addproductmodel().sp}',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
      ),
      TextSpan(
        text: '${Addproductmodel().currency}${Addproductmodel().mrp}',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal,decoration: TextDecoration.lineThrough, color: Colors.black54),
      ),
    ])
    );
  }

  Widget mrpprice(){
    Container(
      child: Text("${Addproductmodel().currency}${Addproductmodel().mrp}" ,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,color: Colors.black
        ),
      ),
    );
  }


  Widget add(){
    return Container(
      height: 20,
      child: OutlineButton(
          onPressed: (){

            setState(() {
              addproduct=true;
            });
          },
          borderSide: BorderSide(color: Colors.blue),
          //color: Colors.blueAccent,
          //disabledBorderColor: Colors.blueAccent,
          child: Text("ADD +",style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.normal),
          )
      ),
    );

  }

  Widget productname(){

    Wrap(

      children: [
        Text(
          Addproductmodel().product_name ,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

      ],
    );

  }

  Widget addmore(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4),
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              if(_counter==1) {
                setState(() {
                  addproduct=false;
                });
              }
              else{
                _decrementCounter();
              }
            },
            child: Container(
              height: 18,
              width: 25,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                  //border: Border.all(color: Colors.blueAccent),

                  shape: BoxShape.rectangle, color: Colors.white
              ),
              child: Center(

                child: Text("-", style: TextStyle(
                    color: Colors.blueAccent, fontSize: 16, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Container(
            height: 18,
            width: 25,

            child: Center(
              child: Text("$_counter", style: TextStyle(
                color: Colors.blueAccent, fontSize: 16,),),
            ),
          ),
          InkWell(
            onTap: (){
              if(_counter<=99){
                _incrementCounter();
              }
            },
            child: Container(
              height: 18,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  shape: BoxShape.rectangle, color: Colors.white
              ),
              child: Center(
                child: Text("+" , style: TextStyle(
                    color: Colors.blueAccent, fontSize: 16, fontWeight: FontWeight.bold),),
              ),
            ),
          )
        ],
      ),
    );

  }
}
