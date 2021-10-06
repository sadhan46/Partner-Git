import 'package:flutter/material.dart';
import 'package:flutter_app/Model/addproductmodel.dart';
import 'package:flutter_app/Model/supermodel.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_app/widget/ProductCard.dart';

class Products extends StatefulWidget {
  Products({Key key, this.url}) : super(key: key);
  final String url;

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  NetworkHandler networkHandler = NetworkHandler();
  SuperModel superModel = SuperModel();
  List<Addproductmodel> data = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get(widget.url);
    superModel = SuperModel.fromJson(response);
    setState(() {
      data = superModel.data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((item) => ProductCard(addProductModel: item,networkHandler: networkHandler ,)).toList(),
    );
  }
}
