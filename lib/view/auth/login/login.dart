
import 'dart:developer';

import 'package:edada/view/auth/register/register.dart';
import 'package:flutter/material.dart';

import '../../../controller/Auth/loginCon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignInSelected = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController PhoneC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override


  @override
  void initState() {
    super.initState();
    // your initialization code here
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 25,
          child: Image.asset("asset/images/Maskgroup.png",width: 25,height: 25,),
        ),
        title:
        Container(
          width: 150,
          height: 34,
           child: Image.asset("asset/images/appstitle.png",width: 134,height: 34,),
        ),
        centerTitle: true,

      ),
      backgroundColor: Colors.white,
      body: Padding(
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

                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: isSignInSelected ? Colors.orangeAccent : Colors.grey,
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
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
                                color: !isSignInSelected ? Colors.orangeAccent : Colors.grey,
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
              SizedBox(height: 25),
              Text("Welcome Back!",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
              SizedBox(height: 10),
              Text("Please enter your details to login.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff757575)),),
              SizedBox(height: 30),
              Text("Phone Number",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xff242424)),),
              SizedBox(height: 15),

                 TextFormField(
                   controller: PhoneC,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Phone number is required";
                      }else{
                      return null;
                      }
                    },
                          
                  decoration: InputDecoration(
                      labelText: "Enter your phone number",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                ),

              SizedBox(height: 15),
              Text("Password",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xff242424)),),
              SizedBox(height: 15),
              TextFormField(
              controller: passwordC,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Password required";
                  }else{
                    return null;
                  }
                },

                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffF4A758),
                  ),
                ),
              ),
              SizedBox(height: 30),


             InkWell(
                  onTap: () {

                    LoginConrtoller().LoginData(phone: PhoneC.text, password: passwordC.text);
                  },
                  child: Card(
                    color:  Color(0xffF4A758),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xff222222)),),
                    )),
                  ),
                ),

              SizedBox(height: 15),
          
              Center(child: Text("Or",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff222222)),)),
              SizedBox(height: 15),
          
              Card(
                color: Color(0xFFF4A758).withOpacity(0.06),
                  child: Center(child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset("asset/images/google.png",width: 20, height: 20,fit: BoxFit.cover,),
                      Text("Sign in with google",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),),
                    ],
                  ),
                )),
              ),
              SizedBox(height: 15),


              Card(
                color: Color(0xFFF4A758).withOpacity(0.06),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset("asset/images/facebook.png",width: 20, height: 20,fit: BoxFit.cover,),
                      Text("Sign in with Facebbok",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),),
                    ],
                  ),
                )),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Color(0xff424242)),),
                  SizedBox(width: 10),
                  Text("Register here",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.orangeAccent),),
                ],
              )
          
            ],
          ),
        ),
      ),

    );
  }
}
