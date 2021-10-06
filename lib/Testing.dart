import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class testing extends StatefulWidget {
  @override
  _testingState createState() => _testingState();
}

List<String> start_time =["10:00 AM","11:00 AM","03:00 PM","07:00 PM"];
List<String> customer_name =["Sadhan","Madhan","Gagan","Pavan"];
List<String> total =["150","320","430","150"];
List<String> customer_contact_number =["9876541235","9987654321","8879654123","9987289654"];

class _testingState extends State<testing> {
  Widget page = CircularProgressIndicator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('Shop-link'),
      backgroundColor: Color(0xff1C396D),),
      body: /*Column(
        children: [
          Card(
            child: Column(
              children: [
                Column(
                  children: [
                    Text("Total Service Time", style: TextStyle(fontSize: 16,
                        color: Colors.black)),
                    RichText(text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: '34', style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.black)),
                          TextSpan(text: 'Hrs ',style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.w600,color: Colors.black)),
                          TextSpan(text: '33', style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.black)),
                          TextSpan(text: 'mins',style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.w600,color: Colors.black)),
                        ]
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.125),
                      child: Column(
                        children: [
                          Text("Services", style: TextStyle(fontSize: 16,
                              color: Colors.black)),
                          Text("456", style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.125),
                      child: Column(
                        children: [
                          Text("Total Earnings", style: TextStyle(fontSize: 16,
                              color: Colors.black)),
                          RichText(text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: '₹ ', style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: Colors.black)),
                                TextSpan(text: '788',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black)),
                              ]
                          )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.125),
                      child: Column(
                        children: [
                          Text("Services", style: TextStyle(fontSize: 16,
                              color: Colors.black)),
                          Text("456", style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.125),
                      child: Column(
                        children: [
                          Text("Total Earnings", style: TextStyle(fontSize: 16,
                              color: Colors.black)),
                          RichText(text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: '₹ ', style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: Colors.black)),
                                TextSpan(text: '788',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black)),
                              ]
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Column(
                  children: [
                    Text("Total Service Time", style: TextStyle(fontSize: 16,
                        color: Colors.black)),
                    RichText(text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: '34', style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.black)),
                          TextSpan(text: 'Hrs ',style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.w600,color: Colors.black)),
                          TextSpan(text: '33', style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.black)),
                          TextSpan(text: 'mins',style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.w600,color: Colors.black)),
                        ]
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),*/
      ListView.builder(itemBuilder: (context,index){
        return
          /*Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal:
                16.0),
                visualDensity: VisualDensity(vertical: -4),
                dense: true,
                tileColor: Colors.white,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Text(" ${start_time[index]}" ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,),),
                    ),
                    Expanded(
                      child: Text(" ${customer_name[index]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,),),
                    )
                  ],
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      child: Text("${total[index]}",style: TextStyle(fontSize: 15),),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          //Icon(CupertinoIcons.phone,size: 16,),
                          Text(" ${customer_contact_number[index]}",style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    )
                  ],

                ),
                trailing: CircleAvatar(child: Icon(Icons.call,color: Colors.white,),backgroundColor: Colors.blue),
              ),
              Container(
                height: 2,
                color: Colors.grey.withOpacity(0.03),
              )
            ],
          );*/
          Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(12,8,12,8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text:"₹",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none)),
                            TextSpan(text:total[index],
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none)),
                          ]
                      ),
                      ),
                      Divider(height: 3.0,),
                      Text(start_time[index],style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(customer_name[index],style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,)),
                      Divider(height: 3.0,),
                      Text(customer_contact_number[index],style: TextStyle(fontSize: 16,)),
                    ],
                  ),/*
                  RichText(text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text:"₹",
                            style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none)),
                        TextSpan(text:total[index],
                            style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none)),
                      ]
                  ),
                  )*/
                  Container(
                    width: 50,
                    child: Center(
                      child: Text("1",style: TextStyle(
                          fontSize: 23.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none)),
                    ),
                  ),
                ],
              ),
            ),
          );
      },
        itemCount: 4,
        shrinkWrap: true,
      ),
    );
  }
}
