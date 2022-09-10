import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const Map<String, String> headers = {
    'Content-Type': 'application/json'
  };

  static Future<http.Response> get(Uri uri) async {
    return await http.get(uri, headers: headers);
  }

  static Future<http.Response> post(Uri uri, Map<String, String> body) {
    String jsonEncoded = jsonEncode(body);
    return http.post(uri, body: jsonEncoded, headers: headers);
  }

  static Future<http.Response> postWithoutBody(Uri uri) {
    return http.post(uri, headers: headers);
  }

  static Future<http.Response> put(Uri uri) {
    return http.put(uri, headers: headers);
  }

  static Map<String, dynamic> decodeResponse(http.Response bodyEncode) {
    return jsonDecode(utf8.decode(bodyEncode.bodyBytes))
        as Map<String, dynamic>;
  }
}