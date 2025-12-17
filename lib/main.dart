import 'package:edada/product/productui.dart';
import 'package:edada/view/auth/login/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:edada/view/auth/register/register.dart';
import 'package:edada/view/splash/splash.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(
    MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home:ProductScreen(),
    )
  );
}