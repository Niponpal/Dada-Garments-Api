import 'package:flutter/material.dart';

class MyOrderdetails extends StatelessWidget {
  const MyOrderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("MY ORDERS Details",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Order ID", style: TextStyle(color: Colors.grey, fontSize: 13)),
                        Text("ORD1765953507", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Status", style: TextStyle(color: Colors.grey)),
                        Text("Pending", style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Payment", style: TextStyle(color: Colors.grey)),
                        Text("COD", style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Total", style: TextStyle(color: Colors.grey)),
                        Text("3000 ৳", style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 22),


             Text("Customer Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
             SizedBox(height: 8),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.person, size: 20, color: Colors.orangeAccent),
                        SizedBox(width: 10),
                        Expanded(child: Text("Mamun", style: TextStyle(fontSize: 15))),
                      ],
                    ),
                     SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.phone, size: 20, color: Colors.orangeAccent),
                        SizedBox(width: 10),
                        Expanded(child: Text("017xxxxxxxx", style: TextStyle(fontSize: 15))),
                      ],
                    ),
                     SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.location_on, size: 20, color: Colors.orangeAccent),
                        SizedBox(width: 10),
                        Expanded(child: Text("Uttara Road 3, Uttara, Dhaka", style: TextStyle(fontSize: 15))),
                      ],
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 22),

             Text("Items", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
             SizedBox(height: 8),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Headphone", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                          SizedBox(height: 6),
                          Text("Price: 1500 ৳"),
                          Text("Quantity: 2"),
                          SizedBox(height: 4),
                          Text("Subtotal: 3000 ৳", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),


            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Confirm Order", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      )


      ,
    );
  }
}
