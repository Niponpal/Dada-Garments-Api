import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:developer';

class ProductGetApi {
  Future<Map> ProductApi() async {
    try {
      Uri url = Uri.parse("https://eplay.coderangon.com/api/products/3");
      var res = await http.get(url);

      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        log("Data Successful: $jsonData");
        return jsonData;
      } else {
        EasyLoading.showError("Data Unloaded");
      }
    } catch (e) {
      log("Error: $e");
    }

    return {};
  }
}
