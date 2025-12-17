



import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';

class ProductGetController{
  Future<void> getProduct() async{
    try{
      Uri Url = Uri.parse("https://eplay.coderangon.com/api/products");
      var response= await http.get(Url);
      if(response.statusCode==200){
        var Jdata = jsonDecode(response.body);
        return Jdata['data'];
      }
      else {
        EasyLoading.showError("Product Load Failed.");
      }
    }
        catch(e){
      log("Error: ================ $e");
        }
  }

}