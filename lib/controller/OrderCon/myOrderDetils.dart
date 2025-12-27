import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class OrderDtailsPages {
  Future<Map> OrderDetailsGateData() async {
    try {
      Uri url = Uri.parse(
        "https://b4.coderangon.com/api/order/details/ORD1766827006",
      );
      var response = await http.get(url);
      log("================${response.statusCode}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      }
    } catch (e) {
      log("Error: $e");
    }

    return {};
  }
}
