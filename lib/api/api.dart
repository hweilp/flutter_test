// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:http/http.dart';
import 'package:flutterproject/api/http.dart';
// import 'package:flutterproject/api/test.dart';
// import 'package:flutterproject/api/error_handler.dart';

/// 所有接口请求

class ApiInterface {
  // test
  static test([dynamic data]) async {
    return Http.request('/test', 'get', data);
  }

  // login
  static login(data) async {
    return Http.request('/login', 'post', data);
  }

  //userList
  static userList([dynamic data]) async {
    return Http.request('/personal', 'get', data);
  }
}
