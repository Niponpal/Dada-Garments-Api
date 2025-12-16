
import 'package:edada/view/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  autoNavigate() async{

    await Future.delayed(Duration(seconds: 3));

    FlutterSecureStorage storage = FlutterSecureStorage();

    storage.read(key: "Token");


    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen() ));
  }
  @override

  @override
  void initState() {
    autoNavigate();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircleAvatar(
          radius: 180,


          child:Image.asset(

              width: 283,
              height: 283,
              "asset/images/Splash.png",fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
