import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static Map<String, String> cookies = {};

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

  static String decodeResponse(http.Response bodyEncode) {
    /*
    dynamic decodeResponse = utf8.decode(bodyEncode.bodyBytes);

    print(decodeResponse.runtimeType);

    return jsonDecode(decodeResponse) as Map<String, dynamic>;
    */

    return utf8.decode(bodyEncode.bodyBytes);
  }

  static void updateCookie(http.Response response) {
    String allSetCookie = response.headers['set-cookie']!;

    var setCookies = allSetCookie.split(',');

    for (var setCookie in setCookies) {
      var cookies = setCookie.split(';');

      for (var cookie in cookies) {
        _setCookie(cookie);
      }
    }

    headers['cookie'] = _generateCookieHeader();
  }

  static void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') {
          return;
        }

        cookies[key] = value;
      }
    }
  }

  static String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) {
        cookie += ";";
      }
      cookie += "$key=${cookies[key]!}";
    }

    return cookie;
  }
}
