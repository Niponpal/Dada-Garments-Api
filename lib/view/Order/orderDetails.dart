import 'dart:developer';

import 'package:flutter/material.dart';

import '../../controller/OrderCon/myOrderDetils.dart';

class MyOrderdetails extends StatefulWidget {
  const MyOrderdetails({super.key});

  @override
  State<MyOrderdetails> createState() => _MyOrderdetailsState();
}

class _MyOrderdetailsState extends State<MyOrderdetails> {

  Map orDetails = {};

  myOrdergete() async{

    orDetails = await OrderDtailsPages().OrderDetailsGateData();
    log("========$orDetails====");
    setState(() {

    });

  }

  @override
  @override
  void initState() {
    myOrdergete();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("MY ORDERS Details",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order ID", style: TextStyle(color: Colors.grey, fontSize: 13)),
                        Text(orDetails['order_id'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("Status", style: TextStyle(color: Colors.grey)),
                        Text(orDetails['payment_status'], style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("Payment", style: TextStyle(color: Colors.grey)),
                        Text(orDetails['payment_method'], style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("Total", style: TextStyle(color: Colors.grey)),
                        Text(orDetails['total_amount'], style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 22),


             Text("Customer Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
             SizedBox(height: 8),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children:  [
                        Icon(Icons.person, size: 20, color: Colors.orangeAccent),
                        SizedBox(width: 10),
                        Expanded(child: Text(orDetails['customer_name'], style: TextStyle(fontSize: 15))),
                      ],
                    ),
                     SizedBox(height: 10),
                    Row(
                      children:  [
                        Icon(Icons.phone, size: 20, color: Colors.orangeAccent),
                        SizedBox(width: 10),
                        Expanded(child: Text(orDetails['customer_phone'], style: TextStyle(fontSize: 15))),
                      ],
                    ),
                     SizedBox(height: 10),
                    Row(
                      children:  [
                        Icon(Icons.location_on, size: 20, color: Colors.orangeAccent),
                        SizedBox(width: 10),
                        Expanded(child: Text("${orDetails['address']['street']},${orDetails['address']['upazila']},${orDetails['address']['district']},", style: TextStyle(fontSize: 15))),
                      ],
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 22),

             Text("Items", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
             SizedBox(height: 8),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text("${orDetails['items'][0]["product_name"]}", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                          SizedBox(height: 6),
                          Text("Price: ${orDetails['items'][0]["price"]}"),
                          Text("Quantity: ${orDetails['items'][0]["quantity"]}"),
                          SizedBox(height: 4),
                          Text("Subtotal: ${orDetails['items'][0]["subtotal"]} ৳", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ],
        ),
      )


      ,
    );
  }
}
