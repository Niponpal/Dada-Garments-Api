import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class SellingController {
  Future<Map> SellingGetApi() async {
    try {
      Uri Url = Uri.parse("https://b4.coderangon.com/api/home-products");
      var response = await http.get(Url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      } else {
        EasyLoading.showError("Something is Wrong");
      }
    } catch (e) {
      log("Error: $e");
    }
    return {};
  }
}
