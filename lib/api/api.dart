// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:http/http.dart';
import 'package:flutterproject/api/http.dart';
import 'package:flutterproject/api/test.dart';
// import 'package:flutterproject/api/error_handler.dart';

/// 所有接口请求

class ApiInterface {
  // HttpTest
  static testData(data) async {
    return HttpTest.postData('/login', data);
  }

  // test
  static test([dynamic data]) async {
    return Http.request('/test', 'get', data);
  }

  // login
  static login(data) async {
    return Http.request('/login', 'post', data);
  }

  // loginout
  static loginout() async {
    return Http.request('/loginout', 'get');
  }

  // register
  static register(data) async {
    return Http.request('/register', 'post', data);
  }

  //userList
  static userList([dynamic data]) async {
    return Http.request('/personal', 'get', data);
  }

  // getVipBanner
  static getVipBanner() async {
    return Http.request('/vip_banner_list', 'get');
  }
}
