

import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';

class RegissterController{

  Future<void> RegisterData ({required Map data}) async {
     try{
       Uri Url = Uri.parse("https://b4.coderangon.com/api/register");

       var body = {
         "name": "Nipon",
         "phone": "01706356852",
         "passwor": "11111111",
         "email": "niponpla52@gmail.com",
         "address": "ECB",
       };

       var header = {
          "Accept":"application/json"
       };

       var response = await http.post(Url,body:data,headers: header);
       log("======================================asdfdsaaaaaaaaaaaaaf${response.statusCode}");
       if(response.statusCode==201){
         EasyLoading.showSuccess("Data Added Successful");
        log("Data Added Successful");
       }
       else if(response.statusCode==422){
         EasyLoading.showError("Email or Phone Number Token");

       }else{
         EasyLoading.showError("Something is Wrong");
       }

     }
         catch(e){
       log("Error: $e");
         }

   }

}