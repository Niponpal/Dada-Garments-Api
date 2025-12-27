import 'dart:developer';

import 'package:http/http.dart' as http;

class OrderDtailsPages{
  Future<List> OrderDetailsGateData() async{
   try{
     Uri url = Uri.parse("https://b4.coderangon.com/api/order/details/ORD1765953507");
     var response = await http.get(url);
     log("================${response.statusCode}");
   }
   catch(e){
     log("Error: $e");
   }

    return [];
  }
}