import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:edada/controller/home/categorycont.dart';
import 'package:edada/controller/home/sliderCont.dart';
import 'package:flutter/material.dart';

import '../controller/home/sellingCont.dart';

class HomeProductScreen extends StatefulWidget {
  const HomeProductScreen({super.key});

  @override
  State<HomeProductScreen> createState() => _HomeProductScreenState();
}

class _HomeProductScreenState extends State<HomeProductScreen> {
      bool isLoading = true;

     List sliderList= [];
     List categoryList= [];
     Map SelingData={};

     fatchSellingP() async{
       SelingData = await SellingController().SellingGetApi();

       log("===delling================$SelingData");
       setState(() {});
     }

     featchSlider () async {
       setState(() {

       });
     sliderList= await SliderController().SlidergetApi();
       setState(() {});
     }

     featchCategory () async{
       setState(() {

       });
      categoryList= await CategoryController().CategoryGetApi();

      setState(() {

      });
     }

  @override
  @override
  void initState() {
       setState(() {

       });
    isLoading = true;
    featchSlider();
    featchCategory();
    fatchSellingP();
    super.initState();
    isLoading = false;
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(image: AssetImage("asset/images/icons.png",),
          width: 10,
          height: 10,
          color: Colors.black,),
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person,
              size: 40.0,
              color: Colors.black,),
          )
        ],
      ),
      body: isLoading==true? CircularProgressIndicator(): Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),


              CarouselSlider(
                options: CarouselOptions(height: 150.0),
                items: sliderList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child:     ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 350,
                            height: 150,
                            color: Colors.grey,
                            child: Image.network(
                              "https://eplay.coderangon.com/storage/${i['image']}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),


              SizedBox(height: 18,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Categories Area Start

                  Text("Categories",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600),),
                  SizedBox(height: 15,),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) => Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 6),
                            width: 110,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:  ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 90,
                                height: 100,
                                color: Colors.grey,
                                child: Image.network(
                                  "https://eplay.coderangon.com/storage/${categoryList[index]['image']}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned
                            (
                            bottom:50 ,
                            left: 25,
                            child: Text("${categoryList[index]['name']}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),maxLines: 1,overflow:TextOverflow.ellipsis,),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  // Categories Area End
                  // Best Selling Area Start
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Best Selling",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600),),
                      Text("See all",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600,color: Colors.orangeAccent),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  GridView.builder(
                    shrinkWrap: true,
                    physics:  NeverScrollableScrollPhysics(),
                   // itemCount: SelingData.length,
                    itemCount: SelingData['hot-selling']?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.58,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                              child: Image.network(
                                "https://eplay.coderangon.com/storage/${SelingData['hot-selling'][index]['image']}",
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Title
                                  Text(
                                    "${SelingData['hot-selling'][index]['title']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(height: 6),

                                  /// Price
                                  Row(
                                    children: [
                                      Text(
                                        "${SelingData['hot-selling'][index]['price']}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "${SelingData['hot-selling'][index]['old_price']}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),

                                  /// Button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 36,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      child: Text("Add To Cart"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15,),
                  // Best Selling Area End
                  // New Arrival Area start

                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("top-selling",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600),),
                      Text("See all",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600,color: Colors.orangeAccent),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //itemCount: 2,
                    itemCount: SelingData['top-selling']?.length ?? 0,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.58,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                              child: Image.network(
                                "https://eplay.coderangon.com/storage/${SelingData['top-selling'][index]['image']}",
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Title
                                  Text(
                                    "${SelingData['top-selling'][index]['title']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(height: 6),

                                  /// Price
                                  Row(
                                    children: [
                                      Text(
                                        "${SelingData['top-selling'][index]['price']}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "${SelingData['top-selling'][index]['old_price']}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),

                                  /// Button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 36,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      child: Text("Add To Cart"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15,),
                  // New Arrival Area End

                  //New Product Area start

                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New Product",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600),),
                      Text("See all",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600,color: Colors.orangeAccent),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //itemCount: 2,
                    itemCount: SelingData['new-product']?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.58,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                              child: Image.network(
                                "https://eplay.coderangon.com/storage/${SelingData['new-product'][index]['image']}",
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Title
                                  Text(
                                    "${SelingData['new-product'][index]['title']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(height: 6),

                                  /// Price
                                  Row(
                                    children: [
                                      Text(
                                        "${SelingData['new-product'][index]['price']}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "${SelingData['new-product'][index]['old_price']}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),

                                  /// Button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 36,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      child: Text("Add To Cart"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 15,),
                  // New Arrival Area End
                ],
              ),

            ],
          ),
        ),
      ),
      
    );
  }
}
