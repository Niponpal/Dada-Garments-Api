

import 'dart:developer';

import 'package:edada/controller/p_detailsCon/ui.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.pId});

  final int pId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  Map Productdata = {};

  featchData() async{

    var response = await ProductGetApi().ProductApi(id: widget.pId);
    var data = response['data'];

    setState(() { });
    Productdata = data;
    setState(() { });
      log("$data");
  }

  @override

  @override
  void initState() {
    featchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 25,
          child: Image.asset(
            "asset/images/Maskgroup.png",
            width: 25,
            height: 25,
          ),
        ),
        title: Container(
          width: 150,
          height: 34,
          child: Image.asset(
            "asset/images/appstitle.png",
            width: 134,
            height: 34,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,right:0 ,left:20 ,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://eplay.coderangon.com/public/storage/${Productdata['image']}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        // Gallery Images
                        if (Productdata['gallery'] != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(Productdata['gallery'].length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://eplay.coderangon.com/public/storage/${Productdata['gallery'][index]}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),


                        // Row(
                        //   spacing: 4,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       width: 80,
                        //       height: 80,
                        //       decoration: BoxDecoration(
                        //         image: DecorationImage(
                        //           image: AssetImage(
                        //             "asset/images/detailsimag.png",
                        //           ),
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       width: 80,
                        //       height: 80,
                        //       decoration: BoxDecoration(
                        //         image: DecorationImage(
                        //           image: AssetImage(
                        //             "asset/images/detailsimag.png",
                        //           ),
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       width: 80,
                        //       height: 80,
                        //       decoration: BoxDecoration(
                        //         image: DecorationImage(
                        //           image: AssetImage(
                        //             "asset/images/detailsimag.png",
                        //           ),
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),



                      ],
                    ),
                  ),
                ),
              ),



              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  Productdata['title'] ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Color(0xfff1E1E1E),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  Productdata['category'] ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xfff1E1E1E),
                  ),
                ),
              ),

              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  spacing: 8,
                  children: [
                    Text(
                      "\$${Productdata['price'] ?? '0'}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Color(0xfff1E1E1E),
                      ),
                    ),
                    Text(
                      "\$${Productdata['old_price'] ?? '0'}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Color(0xfff1E1E1E),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Color",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xfff1E1E1E),
                  ),
                ),
              ),
              SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Size",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xfff1E1E1E),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Stock: ${Productdata['stock'] ?? '0'}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xfff1E1E1E),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "rating: ${Productdata['rating'] ?? '0'}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Color(0xfff1E1E1E),
                  ),
                ),
              ),



              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 6),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.orange, width: 3),
                    ),
                  ),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff1E1E1E),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  Productdata['description'] ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xfff1E1E1E),
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

