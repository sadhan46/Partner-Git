import 'package:flutter/material.dart';
import 'package:flutter_app/Model/ServiceAppointment.dart';
import 'package:flutter_app/Model/Services.dart';
import 'package:flutter_app/Model/addservicemodel.dart';
import 'package:flutter_app/NetworkHandler.dart';
import 'package:flutter_app/Secret.dart';
import 'package:flutter_app/customer_info.dart';
import 'package:intl/intl.dart';

class ServiceMenu extends StatefulWidget {

  const ServiceMenu({Key key}) : super(key: key);
  @override
  _ServiceMenuState createState() => _ServiceMenuState();
}

class _ServiceMenuState extends State<ServiceMenu> {
  NetworkHandler networkHandler = NetworkHandler();

  //List<bool> addproduct =[] ;
  //List<int> counter =[];
  Services listModel = Services();
  //ProductListModel cartModel = ProductListModel();
  List<AddServiceModel> _cart = <AddServiceModel>[];
  //ProductListModel cartProducts =ProductListModel();
  ServiceAppointment cartProduct = ServiceAppointment();
  Widget page = CircularProgressIndicator();

  ServiceAppointment timing = ServiceAppointment();

  DateTime date = DateTime.now();

  double sum = 0;
  bool services = true;
  bool loading=true;

  var _date;
  var _slot;
  bool _time=false;
  List<String> slot=[];
  //int d;
  int y;

  String appointmentStartTime;
  String appointmentEndTime;

  int totalHr = 0;
  int totalMin = 0;

  TextStyle headingStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff1C396D));
  TextStyle contentStyle =
  TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'sfpro');

  @override
  void initState() {
    super.initState();
    //cartProducts.cart_=List<ProductModel>();
    cartProduct.cart_products=<AddServiceModel>[];
    //cartModel.data=<ProductModel>[];
    fetchData();
    // _addproduct();
  }

  void fetchData() async {
    loading = true;
    var response = await networkHandler.get(getServices);
    setState(() {
      listModel = Services.fromJson(response);
      loading = false;
      if(listModel.data.length==0){
        services=false;
      }
    });
  }

  void fetchTimings(d) async {
    var response = await networkHandler.get(
        fetchAppointment+"${DateFormat('y-M-d').format(date.add(Duration(days: d))).toString()}");

    setState(() {
      timing = ServiceAppointment.fromJson(response["data"]);
      _time= timing != null ? true : false;
    });
  }



  @override
  Widget build(BuildContext context) {
    TimeOfDay totalTime = TimeOfDay(hour: totalHr, minute: totalMin);
    TimeOfDay slot1StartingTime = timing.slot_1_starting_time == null ? null : stringToTime (timing.slot_1_starting_time);
    TimeOfDay slot1EndingTime = timing.slot_1_ending_time == null ? null : stringToTime(timing.slot_1_ending_time);
    TimeOfDay slot2StartingTime = timing.slot_2_starting_time == null ? null : stringToTime(timing.slot_2_starting_time);
    TimeOfDay slot2EndingTime = timing.slot_2_ending_time == null ? null : stringToTime(timing.slot_2_ending_time);
    TimeOfDay slot3StartingTime = timing.slot_3_starting_time == null ? null : stringToTime(timing.slot_3_starting_time);
    TimeOfDay slot3EndingTime = timing.slot_3_ending_time == null ? null : stringToTime(timing.slot_3_ending_time);
    TimeOfDay slot4StartingTime = timing.slot_4_starting_time == null ? null : stringToTime(timing.slot_4_starting_time);
    TimeOfDay slot4EndingTime = timing.slot_4_ending_time == null ? null : stringToTime(timing.slot_4_ending_time);
    TimeOfDay slot5StartingTime = timing.slot_5_starting_time == null ? null : stringToTime(timing.slot_5_starting_time);
    TimeOfDay slot5EndingTime = timing.slot_5_ending_time == null ? null : stringToTime(timing.slot_5_ending_time);
    TimeOfDay slot6StartingTime = timing.slot_6_starting_time == null ? null : stringToTime(timing.slot_6_starting_time);
    TimeOfDay slot6EndingTime = timing.slot_6_ending_time == null ? null : stringToTime(timing.slot_6_ending_time);

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double _height1 = _height * 0.5;
    return
    DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff1C396D),
          title: Center(child: Text("Services",style:  TextStyle(fontSize: 25),),),
          bottom: TabBar(
            //indicatorColor: Color(0xff6B8BC6),
            tabs: [
              Tab(
                text: "Services",
              ),
              Tab(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Cart  ",
                          style: new TextStyle(
                            color: Colors.white,
                          )),
                      _cart.length==0?Text(''):Container(
                        padding: EdgeInsets.all(1),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: new Text(
                        '${_cart.length}',
                          style: new TextStyle(
                            color: Color(0xff1C396D),
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            listModel.data == null || services == false
                ? Container(
                  child: Center(
                      child: services ? page : Text("No services added yet"),),
                )
                : Stack(
                  children: [
                    Container(
                      child: ListView.builder(
                        itemBuilder: (context, index) {

                            return Container(
                              padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                              child: InkWell(
                                child: ListTile(
                                  title: Text(
                                    listModel.data[index].serviceName,
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),
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
                                      )
                                      ,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [

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
                                          /*Container(
                                            height: 20,
                                              child:
                                              listModel.data[index].addProduct
                                                  ? Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
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
                                                          onTap: () {
                                                            if (listModel.data[index].counter == 1) {

                                                              setState(() {

                                                                _cart.remove(listModel.data[index]);

                                                                sum = sum -  (listModel.data[index].counter * double.parse(listModel.data[index].serviceCost));
                                                                totalHr = totalHr - (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                                totalMin= totalMin - (listModel.data[index].counter * int.parse(listModel.data[index].min));
                                                                listModel.data[index].addProduct = false;
                                                              });
                                                            }
                                                            else {
                                                              setState(
                                                                      () {
                                                                    sum = sum - (listModel.data[index].counter * double.parse(listModel.data[index].serviceCost));
                                                                    totalHr = totalHr - (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                                    totalMin= totalMin - (listModel.data[index].counter * int.parse(listModel.data[index].min));

                                                                    listModel.data[index].counter--;

                                                                    sum = sum + (listModel.data[index].counter * double.parse(listModel.data[index].serviceCost));
                                                                    totalHr = totalHr + (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                                    totalMin= totalMin + (listModel.data[index].counter * int.parse(listModel.data[index].min));

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

                                                                shape: BoxShape.rectangle,
                                                                color: Colors.white),
                                                            child: Center(
                                                              child: Text("-", style: TextStyle(
                                                                  color: Colors.blueAccent,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 18,
                                                          width: 25,
                                                          child: Center(
                                                            child: Text(
                                                              listModel.data[index].counter.toString(),
                                                              style: TextStyle(
                                                                color: Colors.blueAccent,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            if (listModel.data[index].counter <= 99) {
                                                              //_cart.remove(listModel.data[index]);
                                                              setState(() {
                                                                sum = sum - (listModel.data[index].counter * double.parse(listModel.data[index].serviceCost));
                                                                totalHr = totalHr - (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                                totalMin= totalMin - (listModel.data[index].counter * int.parse(listModel.data[index].min));

                                                                listModel.data[index].counter++;
                                                                sum = sum + (listModel.data[index].counter * double.parse(listModel.data[index].serviceCost));
                                                                totalHr = totalHr + (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                                totalMin= totalMin + (listModel.data[index].counter * int.parse(listModel.data[index].min));


                                                                //listModel.data[index].counter++;
                                                                /* sum=sum+(listModel.data[index].sp
                                                          ==""?(listModel.data[index].counter++*double.parse(listModel.data[index].mrp)):(listModel.data[index].counter++*double.parse(listModel.data[index].sp)));
                                                    */
                                                              });
                                                              //_cart.add(listModel.data[index]);
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
                                                                shape: BoxShape.rectangle,
                                                                color: Colors.white),
                                                            child: Center(
                                                              child: Text("+",
                                                                style: TextStyle(
                                                                    color: Colors.blueAccent,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                              )
                                                  : Container(
                                                     height: 20,
                                                    child: OutlinedButton(
                                                        onPressed: () {
                                                          print(0);
                                                          sum = sum +  (listModel.data[index].counter * double.parse(listModel.data[index].serviceCost));
                                                          print(1);
                                                          totalHr = totalHr + (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                          print(2);
                                                          totalMin= totalMin + (listModel.data[index].counter * int.parse(listModel.data[index].min));

                                                          _cart.add(listModel.data[index]);
                                                          setState(() {
                                                            listModel.data[index].addProduct = true;
                                                          });
                                                        },
                                                        style: OutlinedButton.styleFrom(
                                                          side: BorderSide(color: Colors.blue),
                                                        ),
                                                        //color: Colors.blueAccent,
                                                        //disabledBorderColor: Colors.blueAccent,
                                                        child: Text("ADD +",
                                                          style: TextStyle(
                                                              color: Colors.blue,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.normal),
                                                        )),
                                              ))*/
                                        ],
                                      )
                                    ],
                                  ),
                                  trailing:
                                  listModel.data[index].addProduct
                                      ?Icon(Icons.check_circle_rounded,color: Color(0xff1C396D)):Icon(Icons.brightness_1_outlined),
                                ),
                                onTap: (){

                                  if(listModel.data[index].addProduct==false) {
                                    print(0);
                                    sum = sum +  (listModel.data[index].counter * double.parse(listModel.data[index].serviceCost));
                                    print(1);
                                    totalHr = totalHr + (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                    print(2);
                                    totalMin= totalMin + (listModel.data[index].counter * int.parse(listModel.data[index].min));

                                    _cart.add(listModel.data[index]);
                                    setState(() {
                                      listModel.data[index].addProduct = true;
                                    });
                                  }

                                  else {
                                    setState(() {
                                      _cart.remove(listModel.data[index]);

                                      sum = sum -  (listModel.data[index].counter * double.parse(listModel.data[index].serviceCost));
                                      totalHr = totalHr - (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                      totalMin= totalMin - (listModel.data[index].counter * int.parse(listModel.data[index].min));
                                      listModel.data[index].addProduct = false;
                                    });
                                  }

                                }
                              ),
                          );

                  },
              itemCount:
              listModel.data == null ? 0 : listModel.data.length,
              shrinkWrap: true,
            ),


                    ),
                  ],
                ),


            Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      /*
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pick up Date",
                            style: headingStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child:
                            /*ListView.builder(itemBuilder: (context,index)

                            {
                              var _date=1;
                              return
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      _date=index+1;
                                    });
                                  },
                                  child: Container(
                                    height: 68,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _date == index+1 ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(DateFormat('EEE').format(date1.add(Duration(days: index+1))).toString(), style: contentStyle.copyWith(
                                            color: _date == index+1 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 23
                                        ),),
                                        Text(DateFormat('MMM d').format(date1.add(Duration(days: 1))).toString(), style: contentStyle.copyWith(
                                            color: _date == index+1 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 18
                                        ),)
                                      ],
                                    ),
                                  ),
                                );
                            },
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              shrinkWrap: true,
                            )*/
                            /* Row(
                              children: [
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      _date=1;
                                    });
                                  },
                                  child: Container(
                                    height: 68,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _date==1 ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(DateFormat('EEE').format(date1.add(Duration(days: 1))).toString(), style: contentStyle.copyWith(
                                            color: _date==1 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 23
                                        ),),
                                        Text(DateFormat('MMM d').format(date1.add(Duration(days: 1))).toString(), style: contentStyle.copyWith(
                                            color: _date==1 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 18
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      _date=2;
                                    });
                                  },
                                  child: Container(
                                    height: 68,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _date==2 ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(DateFormat('EEE').format(date1.add(Duration(days: 2))).toString(), style: contentStyle.copyWith(
                                            color: _date==2 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 23
                                        ),),
                                        Text(DateFormat('MMM d').format(date1.add(Duration(days: 2))).toString(), style: contentStyle.copyWith(
                                            color: _date==2 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 18
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      _date=3;
                                    });
                                  },
                                  child: Container(
                                    height: 68,
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: _date==3 ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(DateFormat('EEE').format(date1.add(Duration(days: 3))).toString(), style: contentStyle.copyWith(
                                            color: _date==3 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 23
                                        ),),
                                        Text(DateFormat('MMM d').format(date1.add(Duration(days: 3))).toString(), style: contentStyle.copyWith(
                                            color: _date==3 ? Colors.white : Color(0xff1C396D),
                                            fontSize: 18
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                            */

                            Row(
                              children: [
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 1))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 1))).toString(), 1),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 2))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 2))).toString(), 2),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 3))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 3))).toString(), 3),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 4))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 4))).toString(), 4),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 5))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 5))).toString(), 5),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 6))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 6))).toString(), 6),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 7))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 7))).toString(), 7),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 8))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 8))).toString(), 8),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 9))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 9))).toString(), 9),
                                dateWidget(DateFormat('EEE').format(date1.add(Duration(days: 10))).toString(), DateFormat('MMM d').format(date1.add(Duration(days: 10))).toString(), 10),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Pick up Time",
                            style: headingStyle,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _time == true?
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _time == true ? appointmentPermit(slot1StartingTime, slot1EndingTime, totalTime)
                                    ? appointStartSide(slot1StartingTime, totalTime, 0)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true ? appointmentPermit(slot1StartingTime, slot1EndingTime, totalTime)
                                    ? appointEndSide(slot1EndingTime, totalTime, 1)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot2StartingTime, slot2EndingTime, totalTime)
                                    ? appointStartSide(
                                    slot2StartingTime, totalTime, 2)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true
                                    ?
                                appointmentPermit(slot2StartingTime, slot2EndingTime, totalTime)
                                    ? appointEndSide(
                                    slot2EndingTime, totalTime, 3)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot3StartingTime, slot3EndingTime, totalTime)
                                    ? appointStartSide(
                                    slot3StartingTime, totalTime, 4)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true
                                    ?
                                appointmentPermit(slot3StartingTime, slot3EndingTime, totalTime)
                                    ? appointEndSide(
                                    slot3EndingTime, totalTime, 5)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot4StartingTime, slot4EndingTime, totalTime)
                                    ? appointStartSide(
                                    slot4StartingTime, totalTime, 6)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true
                                    ?
                                appointmentPermit(slot4StartingTime, slot4EndingTime, totalTime)
                                    ? appointEndSide(
                                    slot4EndingTime, totalTime, 7)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot5StartingTime, slot5EndingTime, totalTime)
                                    ? appointStartSide(
                                    slot5StartingTime, totalTime, 8)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot5StartingTime, slot5EndingTime, totalTime)
                                    ? appointEndSide(
                                    slot5EndingTime, totalTime, 9)
                                    : SizedBox()
                                    : SizedBox(),
                                _time == true
                                    ?
                                appointmentPermit(slot6StartingTime, slot6EndingTime, totalTime)
                                    ? appointStartSide(
                                    slot6StartingTime, totalTime, 10)
                                    : SizedBox()
                                    : SizedBox(),

                                _time == true
                                    ?
                                appointmentPermit(slot6StartingTime, slot6EndingTime, totalTime)
                                    ? appointEndSide(
                                    slot6EndingTime, totalTime, 11)
                                    : SizedBox()
                                    : SizedBox(),

                              ],
                            ),
                          ):SizedBox(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),*/
                      Container(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                                    child: ListTile(
                                      title: Text(
                                        _cart[index].serviceName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          _cart[index].hr != "0"
                                              ?
                                          Text(
                                            "${_cart[index].hr}Hr ${_cart[index].min}min",
                                            style: TextStyle(fontSize: 16,fontWeight:FontWeight.w300,color: Colors.black),
                                          )
                                              :
                                          Text(
                                            "${_cart[index].min}min",
                                            style: TextStyle(fontSize: 16,fontWeight:FontWeight.w300,color: Colors.black),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [

                                                  Container(
                                                    padding: EdgeInsets.only(top: 3.0),
                                                    child: Text("${_cart[index].currency}",
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w400,
                                                            decoration: TextDecoration.none)),
                                                  ),
                                                  Text(" ${_cart[index].serviceCost}",
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w400,
                                                          decoration: TextDecoration.none)),
                                                ],
                                              ),
                                              /*Container(
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
                                                      onTap: () {
                                                        if (_cart[index].counter == 1) {
                                                          setState(() {
                                                            sum = sum - ((_cart[index].counter) * double.parse(_cart[index].serviceCost));
                                                            totalHr = totalHr - (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                            totalMin= totalMin - (listModel.data[index].counter * int.parse(listModel.data[index].min));

                                                            _cart[index].addProduct = false;
                                                            _cart.remove(_cart[index]);
                                                            //listModel.data.
                                                          });
                                                        } else {
                                                          setState(() {
                                                            sum = sum - ((_cart[index].counter) * double.parse(_cart[index].serviceCost));
                                                            totalHr = totalHr - (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                            totalMin= totalMin - (listModel.data[index].counter * int.parse(listModel.data[index].min));

                                                            _cart[index].counter--;
                                                            sum = sum + ((_cart[index].counter) * double.parse(_cart[index].serviceCost));
                                                            totalHr = totalHr + (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                            totalMin= totalMin + (listModel.data[index].counter * int.parse(listModel.data[index].min));
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 18,
                                                        width: 25,
                                                        decoration:
                                                        BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(4),
                                                              bottomLeft: Radius.circular(4),
                                                            ),
                                                            //border: Border.all(color: Colors.blueAccent),
                                                            shape: BoxShape.rectangle,
                                                            color: Colors.white),
                                                        child: Center(
                                                          child: Text("-",
                                                            style: TextStyle(
                                                                color: Colors.blueAccent,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 18,
                                                      width: 25,
                                                      child: Center(
                                                        child: Text(_cart[index].counter.toString(),
                                                          style: TextStyle(
                                                            color: Colors.blueAccent,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        if (_cart[index].counter <= 99) {
                                                          setState(() {
                                                            sum = sum - (_cart[index].counter * double.parse(_cart[index].serviceCost));
                                                            totalHr = totalHr - (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                            totalMin= totalMin - (listModel.data[index].counter * int.parse(listModel.data[index].min));

                                                            _cart[index].counter++;
                                                            sum = sum + (_cart[index].counter * double.parse(_cart[index].serviceCost));
                                                            totalHr = totalHr + (listModel.data[index].counter * int.parse(listModel.data[index].hr));
                                                            totalMin= totalMin + (listModel.data[index].counter * int.parse(listModel.data[index].min));

                                                            /* sum=sum+(_cart[index].sp
                                                               ==""?((_cart[index].counter)*double.parse(_cart[index].mrp)):((_cart[index].counter)*double.parse(_cart[index].sp)));
                                                           sum=sum-(_cart[index].sp
                                                               ==""?((_cart[index].counter++)*double.parse(_cart[index].mrp)):((_cart[index].counter++)*double.parse(_cart[index].sp)));
                                                           //_cart[index].counter++;
                                                            */
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 18,
                                                        width: 25,
                                                        decoration:
                                                        BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                              topRight: Radius.circular(4),
                                                              bottomRight: Radius.circular(4),
                                                            ),
                                                            shape: BoxShape.rectangle,
                                                            color: Colors.white
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "+",
                                                            style: TextStyle(
                                                                color: Colors.blueAccent,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            */],
                                          )
                                        ],
                                      ),
                                      trailing: Icon(Icons.check_circle_rounded,color: Color(0xff1C396D),
                                      ),
                                ),
                                  ),
                                onTap: (){
                                  setState(() {
                                    sum = sum - ((_cart[index].counter) * double.parse(_cart[index].serviceCost));
                                    totalHr = totalHr - (_cart[index].counter * int.parse(_cart[index].hr));
                                    totalMin= totalMin - (_cart[index].counter * int.parse(_cart[index].min));

                                    _cart[index].addProduct = false;
                                    _cart.remove(_cart[index]);
                                    //listModel.data.
                                  });
                                },
                              );
                            },
                            itemCount: _cart.length,
                            shrinkWrap: true,
                          ))
                    ],
                  ),
                ),
                _cart.isEmpty ?
                SizedBox()
                : Positioned(
                  bottom: 7,
                  left: 13,
                  height: _height1 * 0.13,
                  width: (_width) - 26,
                      child: ElevatedButton(
                        onPressed: () async{

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => CustomerInfo(
                                username: _cart[0].username,
                                cart: _cart,
                                totalCost: sum.toString(),
                                totalHr: totalHr,
                                totalMin: totalMin,
                              )),
                                  (route) => true);
                          /*
                          cartProduct.username = widget.username;
                          cartProduct.slot_1_starting_time = slot[0];
                          cartProduct.slot_1_ending_time = slot[1];
                          cartProduct.slot_2_starting_time = slot[2];
                          cartProduct.slot_2_ending_time = slot[3];
                          cartProduct.slot_3_starting_time = slot[4];
                          cartProduct.slot_3_ending_time = slot[5];
                          cartProduct.slot_4_starting_time = slot[6];
                          cartProduct.slot_4_ending_time = slot[7];
                          cartProduct.slot_5_starting_time = slot[8];
                          cartProduct.slot_5_ending_time = slot[9];
                          cartProduct.slot_6_starting_time = slot[10];
                          cartProduct.slot_6_ending_time = slot[11];
                          cartProduct.close_days = timing.close_days;
                          cartProduct.date = DateFormat('y-M-d').format(date1.add(Duration(days: y))).toString();

                          cartProduct.cart_products = _cart;
                          cartProduct.start_time=appointmentStartTime;
                          cartProduct.end_time=appointmentEndTime;

                          cartProduct.customer_name = "${TimeOfDay.now().toString()}";
                          cartProduct.customer_address = "zyz";
                          cartProduct.customer_contact_number = "vdc";
                          cartProduct.pin_Code = "svc";
                          cartProduct.total = sum.toString();

                          var response = await networkHandler.post1(
                              "/add_appointment/Add", cartProduct.toJson());
                          if (response.statusCode == 200 ||
                              response.statusCode == 201) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                                    (route) => false);
                          }
    */
                        },
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff1C396D)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),

                        // height:_height1*0.13,
                        //width: _width-100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [

                                Container(
                                  padding: EdgeInsets.only(top: 3.0),
                                  child: Text("${_cart[0].currency}",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none)),
                                ),
                                Text(" $sum",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none)),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Continue  ",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none)),
                                Icon(Icons.arrow_forward_rounded)
                              ],
                            ),
                          ],
                        ), /*
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),

                              ),
                              color: Colors.white),*/

                      ),
                    )
              ],
            )
          ],
        ),
      ),
    );
  }

  appointStartSide(TimeOfDay startingTime, TimeOfDay totalTime, int t) {

    var xTime= DateTime(0,0,0,startingTime.hour,startingTime.minute);
    var yTime= DateTime(0,0,0,totalTime.hour,totalTime.minute);
    Duration add = xTime.difference(yTime);

    int addMinute = add.inMinutes-(add.inHours*60);


    //int totalMinutes = starting_time.minute+total_time.minute;
    //int add_hour =  starting_time.hour+total_time.hour+ totalMinutes ~/ 60 ;
    //int addMinute= (totalMinutes)-(totalMinutes ~/ 60)*60;

    TimeOfDay endingTime=TimeOfDay(hour: add.inHours, minute: addMinute);

    String _startingTime = startingTime.period == DayPeriod.am
        ? "${startingTime.hour}:${startingTime.minute} AM"
        : "${startingTime.hour}:${startingTime.minute} PM";

    String _endingTime = endingTime.period == DayPeriod.am
        ? "${endingTime.hour}:${endingTime.minute} AM"
        : "${endingTime.hour}:${endingTime.minute} PM";
    return InkWell(
      onTap: () {
        setState(() {
          _slot = t;
          slot.clear();
          slot.add(timing.slot_1_starting_time);
          slot.add(timing.slot_1_ending_time);
          slot.add(timing.slot_2_starting_time);
          slot.add(timing.slot_2_ending_time);
          slot.add(timing.slot_3_starting_time);
          slot.add(timing.slot_3_ending_time);
          slot.add(timing.slot_4_starting_time);
          slot.add(timing.slot_4_ending_time);
          slot.add(timing.slot_5_starting_time);
          slot.add(timing.slot_5_ending_time);
          slot.add(timing.slot_6_starting_time);
          slot.add(timing.slot_6_ending_time);
          if(t==0||t==2||t==4||t==6||t==8||t==10){
            slot[t]="${endingTime.hour}:${endingTime.minute}";
            appointmentStartTime="${startingTime.hour}:${startingTime.minute}";
            appointmentEndTime="${endingTime.hour}:${endingTime.minute}";
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color:
            _slot == t ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_startingTime to $_endingTime ",
              style: contentStyle.copyWith(
                color: _slot == t ? Colors.white : Color(0xff1C396D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  appointEndSide(TimeOfDay endingTime, TimeOfDay totalTime, int t) {
    var xTime= DateTime(0,0,0,endingTime.hour,endingTime.minute);
    var yTime= DateTime(0,0,0,totalTime.hour,totalTime.minute);
    Duration subtract = xTime.difference(yTime);

    //int totalMinutes = ending_time.minute + total_time.minute; // subtract minutes
    //int subtract_hour = (ending_time.hour-total_time.hour-(totalMinutes/60)).toInt();
    //int subtractMinute = 60 - ((totalMinutes)-((totalMinutes ~/ 60)*60));

    int subtractMinute = subtract.inMinutes-(subtract.inHours*60);


    TimeOfDay startingTime=TimeOfDay(hour: subtract.inHours, minute: subtractMinute);


    String _startingTime = startingTime.period == DayPeriod.am
        ? "${startingTime.hour}:${startingTime.minute} AM"
        : "${startingTime.hour}:${startingTime.minute} PM";

    String _endingTime = endingTime.period == DayPeriod.am
        ? "${endingTime.hour}:${endingTime.minute} AM"
        : "${endingTime.hour}:${endingTime.minute} PM";
    return InkWell(
      onTap: () {
        setState(() {
          _slot = t;
          slot.clear();
          slot.add(timing.slot_1_starting_time);
          slot.add(timing.slot_1_ending_time);
          slot.add(timing.slot_2_starting_time);
          slot.add(timing.slot_2_ending_time);
          slot.add(timing.slot_3_starting_time);
          slot.add(timing.slot_3_ending_time);
          slot.add(timing.slot_4_starting_time);
          slot.add(timing.slot_4_ending_time);
          slot.add(timing.slot_5_starting_time);
          slot.add(timing.slot_5_ending_time);
          slot.add(timing.slot_6_starting_time);
          slot.add(timing.slot_6_ending_time);
          if(t==1||t==3||t==5||t==7||t==9||t==11){
            slot[t]="${startingTime.hour}:${startingTime.minute}";
            appointmentStartTime="${startingTime.hour}:${startingTime.minute}";
            appointmentEndTime="${endingTime.hour}:${endingTime.minute}";

          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color:
            _slot == t ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_startingTime to $_endingTime ",
              style: contentStyle.copyWith(
                color: _slot == t ? Colors.white : Color(0xff1C396D),
              ),
            ),
          ],
        ),
      ),
    );
  }


  _errorMessageDialog(BuildContext context, String label) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Note  '),
        content: Text('$label '),
        actions: [
          TextButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ));

  dateWidget(String day, String date, d) {
    return InkWell(
      onTap: () {
        if(totalHr == null || totalMin == null){
          _errorMessageDialog(context, "Add services to check appointments");
        }
        else {
          setState(() {
            y = d;
            _date = d;
            fetchTimings(d);
          });
        }
      },
      child: Container(
        height: 68,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color:
            _date == d ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: contentStyle.copyWith(
                  color: _date == d ? Colors.white : Color(0xff1C396D),
                  fontSize: 23),
            ),
            Text(
              date,
              style: contentStyle.copyWith(
                  color: _date == d ? Colors.white : Color(0xff1C396D),
                  fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  stringToTime(String slotTime){
    return slotTime=="null"?null:TimeOfDay(
        hour: int.parse(slotTime.split(":")[0]),
        minute: int.parse(slotTime.split(":")[1]));
  }

  appointmentPermit(TimeOfDay slotStartTime,TimeOfDay slotEndTime,TimeOfDay totalTime){
    if(slotStartTime==null || slotEndTime==null || totalTime==null) {
      return false;
    }
    else{
      return
        ((slotEndTime.hour.toDouble() +
            slotEndTime.minute
                .toDouble() /
                60.0) -
            (slotStartTime.hour
                .toDouble() +
                slotStartTime.minute
                    .toDouble() /
                    60.0)) >
            (totalTime.hour.toDouble() +
                totalTime.minute.toDouble() /
                    60.0)? true:false;
    }
  }

  Container timeWidget(String time, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: (isActive) ? Color(0xff1C396D) : Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: contentStyle.copyWith(
              color: (isActive) ? Colors.white : Color(0xff1C396D),
            ),
          ),
        ],
      ),
    );
  }
}
