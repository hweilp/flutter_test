// import 'dart:io';
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Http {
  static final debug = true;
  // host
  static final host = 'http://127.0.0.1:8080';
  // api 组合
  static final baseUrl = host + '';
  // 初始化参数
  static final Dio _dio = new Dio(new BaseOptions(
      method: "get",
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true));
  // static var authToken = '';

  // request fun
  static request(String uri, String method,
      [Map<String, Object> params]) async {
    // 获取token
    // print('http===$params');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString('auth_token');
    // 请求拦截 token
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
      // print('authToken===$authToken');
      if (authToken == null) {
        options.headers['auth_token'] = '';
      } else {
        options.headers['auth_token'] = authToken;
      }
      return options;
    }));

    // 响应拦截token
    _dio.interceptors.add(InterceptorsWrapper(onResponse: (Response response) {
      var data = response;
      // print('data===$data');
      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return data;
      } else {
        var errData = '网络异常';
        return errData;
      }
    }));

    Options op;
    op = new Options();

    op.method = method;
    // print('uri====$uri');
    // print('params====$params');
    if (method == 'get') {
      return _dio.request<Map<String, dynamic>>(uri,
          queryParameters: params, options: op);
    } else {
      return _dio.request<Map<String, dynamic>>(uri, data: params, options: op);
    }
  }
}
