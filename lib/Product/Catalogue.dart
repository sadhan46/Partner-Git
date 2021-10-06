/*import 'package:flutter/material.dart';
import 'package:flutter_app/CheckoutScreen/CheckoutScreen.dart';
import 'package:flutter_app/Product/AddProduct.dart';
import 'package:flutter_app/Product/ProductScreen.dart';
import 'package:flutter_app/Product/products.dart';


class Catalogue extends StatefulWidget {
  @override
  _CatalogueState createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart App"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Products",),
              Tab(text: "Checkout",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen(),
            CheckoutScreen(),
          ],
        ),
      ),
    );
  }
}
*/