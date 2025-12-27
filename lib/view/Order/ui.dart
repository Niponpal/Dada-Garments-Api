import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../controller/OrderCon/ui.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  final TextEditingController phoneController = TextEditingController();
  List OrderData = [];
  bool isLoading = true;

    feathDataget()async{
      isLoading =true;
      OrderData= await  OrderDataController().OrderApi(Phone: phoneController.text);
      log("======$OrderData");
      isLoading =false;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Search by phone number",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      feathDataget();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            isLoading==true? Center(child: CircularProgressIndicator(),):OrderData.isEmpty? Center(child: Text("No Order Found"),):
            ListView.builder(
              shrinkWrap: true,
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
              ),),
          ],
        ),
      )
    );
  }
}
