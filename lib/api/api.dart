// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:http/http.dart';
import 'package:flutterproject/api/http.dart';
// import 'package:flutterproject/api/test.dart';
// import 'package:flutterproject/api/error_handler.dart';

/// 所有接口请求

class ApiInterface {
  // test
  static test() async {
    return Http.request('/test', 'get');
  }

  // login
  static Future<Map<String, dynamic>> login(data) async {
    // print(data);
    return Http.request('/login', 'post', data);
  }

  // apiTest
  static Future<Map<String, dynamic>> apiTest([String url, data]) async {
    return NetUtil.getJson('/test');
  }
}
