// ignore_for_file: constant_pattern_never_matches_value_type

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiBase {
  // encode  ---  request
  // decode  --- response

  Future<dynamic> postRequest(
      {required String url, required Map<String, dynamic> body}) async {
    // todo  make request to return response

    // todo make encoding the body data
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      // todo return response after decoding below code
      return [responseJson(response), response.statusCode];
    } catch (e) {
      return e;
    }
  }
}

// decode response
dynamic responseJson(http.Response response) {
  switch (response) {
    case 200:
      return jsonDecode(response.body);
    case 400:
      return jsonDecode(response.body);
    case 401:
      return jsonDecode(response.body);
    case 403:
      return jsonDecode(response.body);
    case 500:
      return jsonDecode(response.body);
    default:
      return Exception(
          "Status Error ${response.statusCode} - ${response.body}");
  }
}
