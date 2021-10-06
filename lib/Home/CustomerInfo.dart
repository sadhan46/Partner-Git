import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/Appointments.dart';
import 'package:flutter_app/Model/addservicemodel.dart';

class CustomerInfo extends StatefulWidget {
  final String customerName;
  final String customerContactNumber;
  final String startTime;
  final String endTime;
  //final String totalTime;
  final String total;
  List<AddServiceModel> cartProduct ;

   CustomerInfo(
      {Key key,
      this.customerName,
      this.customerContactNumber,
      this.cartProduct,
      this.total,
      this.startTime,
      this.endTime})
      : super(key: key);

  @override
  _CustomerInfoState createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {


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
                           "${widget.cartProduct[index].serviceName}",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                          ),

                          //duration
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "${widget.cartProduct[index].hr}hr ${widget.cartProduct[index].min}min",
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
                                  "${widget.cartProduct[index].currency}${widget.cartProduct[index].serviceCost} x ${widget.cartProduct[index].counter}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                    child:Text("${widget.cartProduct[index].currency}"
                                        "${int.parse(widget.cartProduct[index].serviceCost)*widget.cartProduct[index].counter}",
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
              itemCount: widget.cartProduct.length,
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
                Text("${widget.total}")
              ],
            ),
            //TotalTime
            Row(
              children: [
                Text("Time"),
                //Text("${widget.totalTime}")
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
                    widget.customerName
                ),
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
                      widget.customerContactNumber
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
                    "${widget.startTime} to ${widget.endTime}"
                )
              ]
            ),
              ],
         )
      ),

    );
  }


}
