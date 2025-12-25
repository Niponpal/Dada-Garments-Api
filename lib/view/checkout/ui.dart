import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Map userData = {};

  getUserData() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    var d = await storage.read(key: "shipping");
    log("======D : $d");
    if(d != null){
      userData = jsonDecode(d);
      log("======userData : ${userData['name']}");
    }
    setState(() {});
  }
  @override

  void initState() {
    getUserData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Check Out",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              "Shipping Information",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 19,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 18),
            Stack(
              children: [
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      spacing: 8,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Text(
                              "Name:",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text("Nipon Chandra Pal"),
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Text(
                              "Phone:",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text("01706356852:"),
                          ],
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            Text(
                              "Address:",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text("Nawabgonj ,"),
                            Text("Dinajpur ,"),
                            Text("Dhaka"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 5, right: 8, child: Icon(Icons.edit)),
              ],
            ),
            SizedBox(height: 14),
            Text(
              "Product",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("asset/images/detailsimag.png"),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      spacing: 5,
                      children: [Text("Name"), Text("Brand"), Text("Price")],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
