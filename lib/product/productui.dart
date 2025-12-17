import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
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
        itemCount: 5,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          childAspectRatio: .7
        ),
        itemBuilder: (context, index) => Stack(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Container(
                      width: 200,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit:BoxFit.cover,
                          image: NetworkImage(
                            "https://png.pngtree.com/png-vector/20240202/ourlarge/pngtree-isolated-white-cap-front-view-png-image_11591512.png",
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    Text("Party Borkha Abaya Koliza",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),

                       Row(
                        spacing: 8,
                        children: [
                          Text("2800",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                          Text("3200",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,decoration: TextDecoration.lineThrough),),
                        ],
                      ),

                   Center(
                     child: Card(
                       child:  Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Add To Cart",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                       ),
                     ),
                   )
                  ],
                ),
              ),
            ),
            Positioned(
                left: 10,
                child: Image.asset("asset/images/offer.png"))
          ],
        ),
      ),
    );
  }
}
