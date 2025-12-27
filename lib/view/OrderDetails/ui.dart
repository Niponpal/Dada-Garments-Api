import 'dart:developer';

import 'package:flutter/material.dart';

import '../../controller/OrderCon/ui.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  List OrderData = [];

    feathDataget()async{
      OrderData= await  OrderDataController().OrderApi(Phone: '01706356852');
      log("======$OrderData");
      setState(() {
        
      });
    }

  @override
  @override
  void initState() {
    feathDataget();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("MY ORDERS",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: OrderData.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${OrderData[index]['order_id']}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,color: Colors.black),),
                      Text("COD"),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                               spacing: 10,
                    children: [
                      Text("${OrderData[index]["customer_name"]}"),
                      Text("${OrderData[index]["customer_phone"]}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${OrderData[index]["address"]["street"]}, ${OrderData[index]["address"]["upazila"]}, ${OrderData[index]["address"]["district"]},"),
                      Text("1500BD")
                    ],
                  ),
                ),

              ],
            ),
          ),
                ),
        ),)
    );
  }
}
