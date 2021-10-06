
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/supermodel.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_app/Product/AddProduct.dart';
import 'package:flutter_app/Product/products.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  NetworkHandler networkHandler = NetworkHandler();
  List listOfProducts;
  List<bool> addproduct =[] ;
  List<int> counter =[];
  SuperModel listModel = SuperModel();


  @override
  void initState() {
    super.initState();
    fetchData();
   // _addproduct();


  }

  void fetchData() async {
    var response = await networkHandler.get("/add_product/getproducts");
    setState(() {
      listOfProducts = response["data"];
    });
  }

  void fetchData1() async {
    var response = await networkHandler.get("/add_product/getproducts");
    setState(() {
      listModel=SuperModel.fromJson(response);
    });
  }

  void _incrementCounter(int index) {
    setState(() {
      counter[index] = counter[index]+1;
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      counter[index] = counter[index]+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shoplink'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Products",),
              Tab(text: "Cart",)
            ],
          ),
        ),
        body:
        TabBarView(
          children: [
            listOfProducts == null ? Center(
              child: Text("We don't have any Products Yet"),
            ) : ListView.builder(itemBuilder: (context,index){
              if(counter.length < listOfProducts.length){
                counter.add(0);
              }
              if(addproduct.length < listOfProducts.length){
                addproduct.add(false);
              }
              return
                Container(
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
                                      image: NetworkHandler().getImage(listOfProducts[index]['_id']),
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
                                  listOfProducts[index]['product_name'].toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),

                               /* Padding(

                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text("${listOfProducts[index]['quantity'].toString()} ${listOfProducts[index]['unit'].toString()}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),*/
                                Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width-120,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      //if (listOfProducts[index]['sp'].toString() != "")
                                       /* Container(
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '${listOfProducts[index]['currency'].toString()}${listOfProducts[index]['sp'].toString()}',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text: '${listOfProducts[index]['currency'].toString()}${listOfProducts[index]['mrp'].toString()}',
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
                                          "${listOfProducts[index]['currency'].toString()}${listOfProducts[index]['mrp'].toString()}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),*/

                                      Container(child: addproduct[index]?Container(
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

                                                if(counter[index]==1) {
                                                  setState(() {
                                                    addproduct[index]=false;
                                                  });
                                                }
                                                else{
                                                  setState(() {
                                                    counter[index]--;
                                                  });
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
                                                child: Text(counter[index].toString(), style: TextStyle(
                                                  color: Colors.blueAccent, fontSize: 16,),),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                if(counter[index]<=99){
                                                  setState(() {
                                                    counter[index]++;
                                                  });
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
                                      ):Container(
                                        height: 20,
                                        child: OutlineButton(
                                            onPressed: (){

                                              setState(() {
                                                addproduct[index]=true;
                                              });
                                            },
                                            borderSide: BorderSide(color: Colors.blue),
                                            //color: Colors.blueAccent,
                                            //disabledBorderColor: Colors.blueAccent,
                                            child: Text("ADD +",style: TextStyle(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.normal),
                                            )
                                        ),
                                      )
                                      )
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

            },
            itemCount: listOfProducts == null ? 0 : listOfProducts.length,
            ),
            /* Cart Screen */Container()
          ],
        ),
       /* floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: (){

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProduct(),
                ),
                    (route) => false);
          },
          label:Text("Add Product"),
        ), */   ),
    );
  }


  Widget add(int index){
    return Container(
      height: 20,
      child: OutlineButton(
          onPressed: (){

            setState(() {
              addproduct[index]=true;
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


  Widget addmore(int index){
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

              if(counter==1) {
                setState(() {
                  addproduct[index]=false;
                });
              }
              else{
                _decrementCounter(index);
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
              child: Text("$counter", style: TextStyle(
                color: Colors.blueAccent, fontSize: 16,),),
            ),
          ),
          InkWell(
            onTap: (){
              if(counter[index]<=99){
                _incrementCounter(index);
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

class Product {
  String id;
  String productName;
  int counter = 0;
  bool addProduct = false;

  Product({
    this.id,
    this.productName,
  });
}
