import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/Appointments.dart';
import 'package:flutter_app/Model/addservicemodel.dart';

class CustomerInfotest extends StatefulWidget {

  CustomerInfotest(
      {Key key})
      : super(key: key);

  @override
  _CustomerInfotestState createState() => _CustomerInfotestState();
}

class _CustomerInfotestState extends State<CustomerInfotest> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          child: Column(
            children: [

              ListView.builder(itemBuilder: (context,index){

                return Container(
                  height: 100,
                  padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            //serviceName
                            Text(
                              "Haircut",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                            ),

                            //duration
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "0hr 30min",
                                style: TextStyle(fontSize: 15,),
                              ),
                            ),

                            //cost
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width - 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "₹ 180 x 5",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                      child:Text("₹260",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

              },
                itemCount: 1,
                shrinkWrap: true,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              //Total
              Row(
                children: [
                  Text("Grand Total"),
                  Text("180")
                ],
              ),
              //TotalTime
              Row(
                children: [
                  Text("Time"),
                  Text("0 Hr 30 min")
                ],
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),

              //CutomerDetails
              Row(
                children: [
                  Text(
                      "CUSTOMER DETAILS  "
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              ),
              //CustomerName
              Row(
                  children: [
                    Container(
                      child: Text(
                          "Name :"
                      ),
                    ),
                    Text(
                        "Gaitonde"),
                  ]
              ),
              //CustomerMobile
              Row(
                  children: [
                    Container(
                      child: Text(
                          "Mobile :"
                      ),
                    ),
                    Text(
                        "0132645978"
                    )
                  ]
              ),
              //AppointmentTime
              Row(
                  children: [
                    Container(
                      child: Text(
                          "Appointment :"
                      ),
                    ),
                    Text(
                        "9:00 am to 10:30 pm"
                    )
                  ]
              ),

              TextButton(onPressed: ()
              {
                _errorMessageDialog(context);
              }, child: Text("try"))
            ],
          )
      ),

    );
  }

  _errorMessageDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        titlePadding: EdgeInsets.all(0),
        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        title: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xff1C396D),
            borderRadius:
            new BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
          ),
          height: 50,
          child: Center(
            child: Text("Gaitonde",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none)),
          ),
        ),
        content: ListView.builder(
          itemBuilder: (context, index) {

            return Container(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: ListTile(
                title: Text(
                  "Haircut",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "0Hr 35min",
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
                              child: Text("₹",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none)),
                            ),
                            Text("280 x 3",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none)),
                          ],
                        ),

                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 3.0),
                                child: Text("₹",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.none)),
                              ),
                              Text("280",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none))

                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );

          },
          itemCount: 1,
          shrinkWrap: true,
        ),
        actions: [
          Row(

            children: [
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          )
        ],
      ));


}
