

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class SliderController{

  Future<List>SlidergetApi() async {
    try{
      Uri Url = Uri.parse("https://b4.coderangon.com/api/sliders");
      var response = await http.get(Url);
      if(response.statusCode==200){
        return  jsonDecode(response.body)['data'];


      }
    }
    catch(e){
      log("Error: $e");
        }
        return[];
  }

}