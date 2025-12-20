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





                ],
              ),

          ],
        ),
      ),
      
    );
  }
}
