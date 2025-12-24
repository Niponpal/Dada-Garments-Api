import 'dart:convert';
import 'dart:developer';

import 'package:edada/view/auth/login/login.dart';
import 'package:flutter/material.dart';

import '../../../controller/Auth/regiCon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});




  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isSignInSelected = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();




  @override

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

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    /// SIGN IN
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignInSelected = true;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: isSignInSelected
                                    ? Colors.orangeAccent
                                    : Colors.grey,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 5,
                              decoration: BoxDecoration(
                                color: isSignInSelected
                                    ? Colors.orangeAccent
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// SIGN UP
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignInSelected = false;
                          });
                        },
                        child: Form(
                          child: Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: !isSignInSelected
                                      ? Colors.orangeAccent
                                      : Colors.grey,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: !isSignInSelected
                                      ? Colors.orangeAccent
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Let’s Get Started!",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  "Create an account.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff757575),
                  ),
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
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff242424),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Password required";
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                    labelText: "Enter Your Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(height: 10),
                Text(
                  "Address",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff242424),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: addressController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Address required";
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                    labelText: "Enter Your Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(height: 10),
                Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff242424),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Email required";
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
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
                      "password": passwordController.text,
                      "email": emailController.text,
                      "address": addressController.text,
                    };

                    log("====================${jsonDecode(jsonEncode(a))}");

                    RegissterController().RegisterData(data:a);

                  },
                  child: Card(
                    color: Color(0xffF4A758),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff222222),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Center(
                  child: Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff222222),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Card(
                  color: Color(0xFFF4A758).withOpacity(0.06),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Image.asset(
                            "asset/images/google.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Sign in with google",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Card(
                  color: Color(0xFFF4A758).withOpacity(0.06),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Image.asset(
                            "asset/images/facebook.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Sign in with Facebbok",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff424242),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
