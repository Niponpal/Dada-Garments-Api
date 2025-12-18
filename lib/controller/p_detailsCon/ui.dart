
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';

class ProductGetApi{
  Future<void> ProductApi() async{
    try{
      Uri url = Uri.parse("");
      var response = await http.get(url);
      if(response.statusCode==200){
        log("Data Successful");
      }
      else{
        EasyLoading.showError("Data Unloaded");
      }
    }
        catch(e){
      log("Error: $e");
        }
  }
}