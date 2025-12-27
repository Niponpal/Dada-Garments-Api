import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


class CheckOutController {
  Future<bool> CheckoutPostApi({required Map data}) async{
    try{
      Uri url = Uri.parse("https://b4.coderangon.com/api/order");
      var header = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };
      var body = jsonEncode(data);
      var response = await http.post(url,body: body,headers: header);
      log("============${response.statusCode}");

       if(response.statusCode==200){
          EasyLoading.showSuccess("Order Conform");
          return true;
      }
       else{
         EasyLoading.showError("Order Failed");
       }
    }
        catch(e){
        log("Eroor: ========= $e");
        }
        return false;
  }
}