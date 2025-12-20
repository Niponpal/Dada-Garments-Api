import 'package:flutter/material.dart';

class HomeProductScreen extends StatefulWidget {
  const HomeProductScreen({super.key});

  @override
  State<HomeProductScreen> createState() => _HomeProductScreenState();
}

class _HomeProductScreenState extends State<HomeProductScreen> {
  @override
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 350,
                height: 150,
                color: Colors.grey,
                child: Image.asset(
                  "asset/images/slider.png",
                  fit: BoxFit.cover,
                ),
              ),
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
                      itemCount: 10,
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
                                child: Image.asset(
                                  "asset/images/slider.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned
                            (
                              bottom:50 ,
                              left: 25,
                              child: Text("Women’s 2",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),maxLines: 1,overflow:TextOverflow.ellipsis,),)
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

          itemCount: 2,
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
                  /// Image
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                    child: Image.asset(
                      "asset/images/slider.png",
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
                          "Party Borkha Abaya Koliza",
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
                              "2880",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "3200",
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
                      Text("New Arrival",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600),),
                      Text("See all",style: TextStyle(fontSize: 19,fontWeight:FontWeight.w600,color: Colors.orangeAccent),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
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
                              child: Image.asset(
                                "asset/images/slider.png",
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
                                    "Party Borkha Abaya Koliza",
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
                                        "2880",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "3200",
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
                    shrinkWrap: true,
                    itemCount: 2,
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
                              child: Image.asset(
                                "asset/images/slider.png",
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
                                    "Party Borkha Abaya Koliza",
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
                                        "2880",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "3200",
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
      
    );
  }
}
