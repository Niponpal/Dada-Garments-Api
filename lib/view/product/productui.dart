import 'dart:developer';

import 'package:edada/controller/product/productCon.dart';
import 'package:edada/view/product/product_details/ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.Tittle});

  @override
  final String Tittle;

  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List productList = [];

  featchProduct() async {
    await Future.delayed(Duration(seconds: 3));
log("=============${widget.Tittle}====================");
    EasyLoading.show(status: "Loading...");
    productList = await ProductGetController().getProduct(t: widget.Tittle);
    EasyLoading.dismiss();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    featchProduct();
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
      body: GridView.builder(
        itemCount: productList.length,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          childAspectRatio: .53,
        ),
        itemBuilder: (context, index) => InkWell(

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  pId: int.parse("${productList[index]['id']}"),
                ),
              ),
            );
          },



          child: Stack(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                        width: 200,
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://eplay.coderangon.com/public/storage/${productList[index]['image']}",
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        "${productList[index]['title']}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Row(
                        spacing: 8,
                        children: [
                          Text(
                            "${productList[index]['price']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${productList[index]['old_price']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),

                      Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                child: Image.asset(
                  "asset/images/offer.png",
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
