import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../app/app_config.dart';
import '../../di/generated.dart';

class NetworkService {
  static String baseUrl = Kiwi.inject<AppConfig>().baseUrl;
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  Client client = Client();

  Future<dynamic> get(
      {required String url, String? customBaseUrl, dynamic query}) async {
    Uri uri = Uri.parse('${customBaseUrl ?? baseUrl}$url?$query');
    if (kDebugMode) {
      print(uri);
    }
    try {
      Response response = await client.get(uri, headers: headers);
      switch (response.statusCode) {
        case 200:
        case 201:
          return response.body;
        default:
          throw jsonDecode(response.body);
      }
    } on SocketException {
      throw ({
        'status': 400,
        'title': 'Error',
        'message': "Check your internet connection"
      });
    } on HandshakeException {
      throw ({'status': '400', 'title': 'error', 'message': "Server Down"});
    } on FormatException {
      throw ({
        'status': '400',
        'title': 'error',
        'message': "Service unavailable, please try again later"
      });
    } catch (e) {
      ({'status': '400', 'title': 'error', 'message': e.toString()});
    }
  }
}
