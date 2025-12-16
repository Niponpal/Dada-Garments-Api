import 'package:edada/view/auth/login/login.dart';
import 'package:edada/view/auth/register/register.dart';
import 'package:edada/view/splash/splash.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    )
  );
}