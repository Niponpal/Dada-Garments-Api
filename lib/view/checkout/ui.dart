import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../shiping/ui.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.productBuyData});

  final Map productBuyData;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Map userData = {};
  Map BuyProductData = {};

  getUserData() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    var d = await storage.read(key: "shipping");
    log("======D : $d");
    if (d != null) {
      userData = jsonDecode(d);
      log("======userData : ${userData['name']}");
    }
    setState(() {});
  }

  getBuyProductData() async {
    BuyProductData = widget.productBuyData;
    log("PPPPPPPPPPPP: $BuyProductData");
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    getBuyProductData();
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
                            Text("${userData['name']}"),
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
                            Text("${userData['phone']}"),
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
                            Text(
                              "${userData['street']}, ${userData['upazila']}, ${userData['district']} ,",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 8,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShippingScreen(),
                        ),
                      ).then((v) {
                        getUserData();
                      });
                    },
                    child: Icon(Icons.edit),
                  ),
                ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://eplay.coderangon.com/storage/${BuyProductData['image']}",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "Name: ${BuyProductData['title']}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Brand: ${BuyProductData['brand']}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Price: ${BuyProductData['price']} BDT",
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
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
