import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  //endpoint
  final endpoint = "https://www.hpb.health.gov.lk/api/get-current-statistical";

  //create future function
  Future<Map<String, dynamic>> getData() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      print(body["data"]);
      Map<String, dynamic> data = body["data"];
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
