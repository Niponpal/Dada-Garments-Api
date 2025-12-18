
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


import 'package:http/http.dart' as http;

class LoginConrtoller {
  
  Future<bool> LoginData({required String phone, required String password})async {
    try{
      Uri Url = Uri.parse("https://b4.coderangon.com/api/login");
      var body = {
        "phone": phone,
        "password": password,
      };
      var header = {
        "Accept":  "application/json"
      };
      var response = await http.post(Url,body:  body, headers: header);

      if(response.statusCode ==200){
        EasyLoading.showSuccess("Succcess Full Login");

        var data =  jsonDecode(response.body)['token'];
         FlutterSecureStorage storage = FlutterSecureStorage();
        log("$data");
         storage.write(key: "token", value: data);

         return true;

      }
      else if(response.statusCode==422){

        EasyLoading.showError("Password or Phone Number Increated");
        log("Passerod or Phone Number Increated");
        return false;
      }
      else{
        EasyLoading.showError("Something is Wrong");
        return false;
      }
    }
   catch(e){

   }
  return false;
  }
  
}