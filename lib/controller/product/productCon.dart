import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


class ProductGetController {
  Future<List> getProduct() async {
    try {
      Uri url = Uri.parse("https://eplay.coderangon.com/api/products");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jData = jsonDecode(response.body);
        return jData['data'];
      } else {
        EasyLoading.showError("Product Load Failed");
      }
    } catch (e) {
      log("Error: $e");
    }
    return [];
  }
}
