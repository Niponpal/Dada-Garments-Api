import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../controller/Auth/regiCon.dart';
import '../auth/login/login.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  bool isSignInSelected = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController upazilaController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  Map userData = {};

  getUserData() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    var d = await storage.read(key: "shipping");
    log("======D : $d");
    if (d != null) {
      userData = jsonDecode(d);
      log("======userData : ${userData['name']}");
      nameController.text = userData['name'];
      phoneController.text = userData['phone'];
      streetController.text = userData['street'];
      districtController.text = userData['upazila'];
      upazilaController.text = userData['district'];
    }
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
        title: Text("Shipping Information",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 15),
                    Text(
                      "Let’s Get Started!",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),

                    SizedBox(height: 15),
                    Text(
                      "Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff242424),
                      ),
                    ),
                    SizedBox(height: 15),

                    TextFormField(
                      controller: nameController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Name is required";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        labelText: "Enter your Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff242424),
                      ),
                    ),
                    TextFormField(
                      controller: phoneController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Phone number is required";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        labelText: "Enter your phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      "upazila",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff242424),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: upazilaController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Password required";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        labelText: "Enter Your upazila",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    SizedBox(height: 10),
                    Text(
                      "Street",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff242424),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: streetController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Address required";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        labelText: "Enter Your Street",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    SizedBox(height: 10),
                    Text(
                      "District",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff242424),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: districtController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Email required";
                        } else {
                          return null;
                        }
                      },

                      decoration: InputDecoration(
                        labelText: "Enter Your District",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        if (!_formKey.currentState!.validate()) {
                          // Exit if form is invalid
                          return;
                        }
                        var a = {
                          "name": nameController.text,
                          "phone": phoneController.text,
                          "upazila": upazilaController.text,
                          "street": streetController.text,
                          "district": districtController.text,
                        };

                        log("====================${jsonDecode(jsonEncode(a))}");

                        RegissterController().RegisterData(data:a);

                      },
                      child: InkWell(
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          var data = {
                            "name": nameController.text,
                            "phone": phoneController.text,
                            "street": streetController.text,
                            "upazila": upazilaController.text,
                            "district": districtController.text,
                          };
                          log("===========${data}==");
                          FlutterSecureStorage storage = FlutterSecureStorage();
                          await storage.write(key: "shipping", value: jsonEncode(data));
                          Navigator.pop(context);
                        },

                        child: Card(
                          color: Color(0xffF4A758),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color:Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),







                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
