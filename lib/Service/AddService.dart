
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Custom/currency.dart';
import 'package:flutter_app/Model/Services.dart';
import 'package:flutter_app/Model/addproductmodel.dart';
import 'package:flutter_app/Model/addservicemodel.dart';
import 'package:flutter_app/Model/supermodel.dart';
import 'package:flutter_app/Navigation_bar.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_app/Product/AddProduct.dart';
import 'package:flutter_app/Product/products.dart';
import 'package:flutter_app/Secret.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {

  NetworkHandler networkHandler = NetworkHandler();
  List<bool> addproduct =[] ;
  List<int> counter =[];
  Services listModel = Services();
  List<Addproductmodel> cart= <Addproductmodel>[];

  final _globalkey = GlobalKey<FormState>();
  TextEditingController serviceName = TextEditingController();
  TextEditingController serviceCost = TextEditingController();
  TextEditingController hr = TextEditingController();
  TextEditingController min = TextEditingController();
  var currency = ['\₹'/*, '\$', '\£','\€'*/];
  var currencySelected = '';
  bool services = true;

  Widget page = CircularProgressIndicator();

  Future<void> addServiceDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          final TextEditingController _textEditingController = TextEditingController();
          return StatefulBuilder(builder: (context,setState){
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              titlePadding: EdgeInsets.all(0),
              title: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xff1C396D),
                  borderRadius:
                  new BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                ),
                height: 50,
                child: Center(
                  child: Text("Add Service",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none)),
                ),
              ),
              content: Form(
                key: _globalkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    serviceNameTextField(),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 11, 8, 11),
                              child: Container(
                                width: 40,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    // labelText: "currencie",
                                  ),
                                  items: currency.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),

                                  value: currencySelected,
                                  onChanged: (String newValueSelected) {
                                    _onDropDownItemSelected(newValueSelected);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(child: serviceCostTextField())
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(child: hrTextField()),
                        Flexible(child: minTextField())
                      ],
                    )

                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Add'),
                  onPressed: () async{
                    if (_globalkey.currentState.validate())
                    {
                      AddServiceModel addServiceModel =AddServiceModel(
                        serviceName: serviceName.text,
                        currency: currencySelected,
                        serviceCost: serviceCost.text,
                        hr: hr.text==""?"0":hr.text,
                        min: min.text
                      );

                      var response = await networkHandler.post1(
                          addService, addServiceModel.toJson());
                      print(response.body);
                      if (response.statusCode == 200 || response.statusCode == 201) {
                        Navigator.of(context).pop();
                        fetchData();
/*
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Navigation_menu()),
                                  (route) => false);*/
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
    currencySelected = currency[0];
    fetchData();
    // _addproduct();

  }


  void fetchData() async {
    var response = await networkHandler.get(getServices);
    setState(() {
      services = true;
      listModel=Services.fromJson(response);
      if(listModel.data.length == 0){
        services=false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C396D).withOpacity(0.05),

      appBar:  AppBar(title: Center(child: Text('Services')),backgroundColor: Color(0xff1C396D),),
      body:
      listModel.data == null || services == false
          ?
      Center(
        child: services ? page : Text("No services added yet"),
      )
          :
      ListView.builder(itemBuilder: (context,index){
        return
          Container(
            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: ListTile(
              title: Text(
                listModel.data[index].serviceName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  listModel.data[index].hr != "0"
                      ?
                  Text(
                    "${listModel.data[index].hr}Hr ${listModel.data[index].min}min",
                    style: TextStyle(fontSize: 16,fontWeight:FontWeight.w300,color: Colors.black),
                  )
                      :
                  Text(
                    "${listModel.data[index].min}min",
                    style: TextStyle(fontSize: 16,fontWeight:FontWeight.w300,color: Colors.black),
                  ),
                  Row(
                    children: [

                      Container(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text("${listModel.data[index].currency}",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none)),
                      ),
                      Text(" ${listModel.data[index].serviceCost}",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none)),
                    ],
                  ),
                ],
              ),
              trailing: InkWell(
                child: Icon(
                  Icons.remove,
                  color: Colors.red.withOpacity(0.75),
                ),
                onTap: () async{
                  await networkHandler.delete(deleteService+"${listModel.data[index].id}");
                  fetchData();
                },
              ),
            ),
          );
      },
        itemCount: listModel.data == null ? 0 : listModel.data.length,
        shrinkWrap: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
        ),
        onPressed: () async{
          await addServiceDialog(context);
        },
        label:Text("Add Service"),
      ),
    );
  }

  Widget serviceNameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(

        controller: serviceName,
        validator: (value) {
          if (value.isEmpty) {
            return "Enter service name";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Service name",
          //labelText: "Service name",
        ),
        maxLines: null,


      ),
    );
  }

  Widget serviceCostTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          CurrencyFormat()
        ],
        controller: serviceCost,
        validator: (value) {
          if (value.isEmpty) {
            return "Enter service cost";
          }else if (value.length > 7) {
            return "Enter less than 1000000";
          }
          return null;
        },
        decoration: InputDecoration(
          //labelText: "Service Cost",
          hintText: "Service Cost"
        ),
        maxLines: null,
      ),
    );
  }

  Widget hrTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,

        validator: (value){
          if(value.contains('.')){
            return "Enter whole number";
          }
          if(value.contains('-')){
            return "Enter whole number";
          }
          if(value.contains(',')){
            return "Enter whole number";
          }
          if(value.contains(' ')){
            return "Enter whole number";
          }
          return null;
        },
        controller: hr,
        decoration: InputDecoration(
          //suffixText: "hr",
          hintText: "hr",
          hintTextDirection: TextDirection.rtl
        ),
        maxLines: null,
      ),
    );
  }

  Widget minTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: min,
        validator: (value){
          if(value.isEmpty){
            return "Enter minutes";
          }
          if(value.contains('.')){
            return "Enter whole number";
          }
          if(value.contains('-')){
            return "Enter whole number";
          }
          if(value.contains(',')){
            return "Enter whole number";
          }
          if(value.contains(' ')){
            return "Enter whole number";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "min",
          hintTextDirection: TextDirection.rtl,
          //suffixText: "min"
        ),
        maxLines: null,
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this.currencySelected = newValueSelected;
    });
  }

  _errorMessageDialog(BuildContext context, String label) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        titlePadding: EdgeInsets.all(0),
        title: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xff1C396D),
            borderRadius:
            new BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
          ),
          height: 50,
          child: Center(
            child: Text("Note",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none)),
          ),
        ),
        content: Text('$label '),
        actions: [
          TextButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ));

}