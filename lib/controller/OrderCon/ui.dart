import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class OrderDataController {
  Future<List> OrderApi({required String Phone}) async {
    try {
      Uri url = Uri.parse("https://b4.coderangon.com/api/orders/$Phone");
      var response = await http.get(url);

      log("=-============${response.statusCode}");
      if(response.statusCode==200){

        EasyLoading.showSuccess("Data Loaded Success");
        return jsonDecode(response.body)["data"];
      }
    } catch (e) {
      log("Error: $e");
    }

    return [];
  }
}
