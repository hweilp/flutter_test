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

// class NetUtil {
//   static final debug = true;
//   static BuildContext context;
//   static final host = 'http://127.0.0.1:8080';
//   static final baseUrl = host + '';

//   // ignore: argument_type_not_assignable
//   static final Dio _dio = new Dio(new BaseOptions(
//       method: "get",
//       baseUrl: baseUrl,
//       connectTimeout: 5000,
//       receiveTimeout: 5000,
//       followRedirects: true));

//   static String token;

//   // static

//   // print('host=== $host');
//   static final LogicError unknowError = LogicError(-1, "未知异常");

//   static Future<Map<String, dynamic>> getJson<T>(String uri,
//       [Map<String, dynamic> paras]) {
//     print('host=== $host');
//     return _httpJson("get", uri, data: paras).then(logicalErrorTransform);
//   }

//   static Future<Map<String, dynamic>> getForm<T>(
//           String uri, Map<String, dynamic> paras) =>
//       _httpJson("get", uri, data: paras, dataIsJson: false)
//           .then(logicalErrorTransform);

//   /// 表单方式的post
//   static Future<Map<String, dynamic>> postForm<T>(
//           String uri, Map<String, dynamic> paras) =>
//       _httpJson("post", uri, data: paras, dataIsJson: false)
//           .then(logicalErrorTransform);

//   /// requestBody (json格式参数) 方式的 post
//   static Future<Map<String, dynamic>> postJson(
//           String uri, Map<String, dynamic> body) =>
//       _httpJson("post", uri, data: body).then(logicalErrorTransform);

//   static Future<Map<String, dynamic>> deleteJson<T>(
//           String uri, Map<String, dynamic> body) =>
//       _httpJson("delete", uri, data: body).then(logicalErrorTransform);

//   /// requestBody (json格式参数) 方式的 put
//   static Future<Map<String, dynamic>> putJson<T>(
//           String uri, Map<String, dynamic> body) =>
//       _httpJson("put", uri, data: body).then(logicalErrorTransform);

//   /// 表单方式的 put
//   static Future<Map<String, dynamic>> putForm<T>(
//           String uri, Map<String, dynamic> body) =>
//       _httpJson("put", uri, data: body, dataIsJson: false)
//           .then(logicalErrorTransform);

//   /// 文件上传  返回json数据为字符串
//   static Future<T> putFile<T>(String uri, String filePath) {
//     var name =
//         filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
//     var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
//     FormData formData = new FormData.from({
//       "multipartFile": new UploadFileInfo(new File(filePath), name,
//           contentType: ContentType.parse("image/$suffix"))
//     });

//     var enToken = token == null ? "" : Uri.encodeFull(token);
//     return _dio
//         .put<Map<String, dynamic>>("$uri?token=$enToken", data: formData)
//         .then(logicalErrorTransform);
//   }

//   static Future<Response<Map<String, dynamic>>> _httpJson(
//       String method, String uri,
//       {Map<String, dynamic> data, bool dataIsJson = true}) {
//     print('host=== $host');
//     var enToken = token == null ? "" : Uri.encodeFull(token);

//     /// 如果为 get方法，则进行参数拼接
//     if (method == "get") {
//       dataIsJson = false;
//       if (data == null) {
//         data = new Map<String, dynamic>();
//       }
//       data["token"] = token;
//     }
//     print('debug== $debug');

//     if (debug) {
//       print('<net url>------$uri');
//       print('<net params>------$data');
//     }

//     /// 根据当前 请求的类型来设置 如果是请求体形式则使用json格式
//     /// 否则则是表单形式的（拼接在url上）
//     Options op;
//     if (dataIsJson) {
//       op = new Options(contentType: ContentType.parse("application/json"));
//     } else {
//       op = new Options(
//           contentType: ContentType.parse("application/x-www-form-urlencoded"));
//     }

//     op.method = method;

//     /// 统一带上token
//     uri = host + uri;
//     uri = method == 'get' ? uri : "$uri?token=$enToken";
//     print('uri=== $uri');
//     return _dio.request<Map<String, dynamic>>(uri, data: data, options: op);
//     // return _dio.request<Map<String, dynamic>>(
//     //     method == "get" ? uri : "$uri?token=$enToken",
//     //     data: data,
//     //     options: op);
//   }

//   /// 对请求返回的数据进行统一的处理
//   /// 如果成功则将我们需要的数据返回出去，否则进异常处理方法���返回异常信息
//   static Future<T> logicalErrorTransform<T>(
//       Response<Map<String, dynamic>> resp) {
//     // print(resp);
//     // print(resp.data);
//     if (resp.data != null) {
//       if (resp.data["code"] == 0) {
//         T realData = resp.data["data"];
//         return Future.value(realData);
//       }
//     }

//     if (debug) {
//       print('resp--------$resp');
//       print('resp.data--------${resp.data}');
//     }
//     LogicError error;
//     if (resp.data != null && resp.data["code"] != 0) {
//       if (resp.data['data'] != null) {
//         /// 失败时  错误提示在 data中时
//         /// 收到token过期时  直接进入登录页面
//         Map<String, dynamic> realData = resp.data["data"];
//         error = new LogicError(resp.data["code"], realData['codeMessage']);
//       } else {
//         /// 失败时  错误提示在 message中时
//         error = new LogicError(resp.data["code"], resp.data["message"]);
//       }

//       /// token失效 重新登录  后端定义的code码
//       if (resp.data["code"] == 10000000) {
// //        NavigatorUtils.goPwdLogin(context);

//       }
//       if (resp.data["code"] == 80000000) {
//         //操作逻辑
//       }
//     } else {
//       error = unknowError;
//     }
//     return Future.error(error);
//   }

//   ///  获取token
//   ///获取授权token
//   static getToken() async {
// //    String token = await LocalStorage.get(LocalStorage.TOKEN_KEY);
//     return token;
//   }
// }

// class LogicError {
//   int errorCode;
//   String msg;

//   LogicError(errorCode, msg) {
//     this.errorCode = errorCode;
//     this.msg = msg;
//   }
// }

// enum PostType { json, form, file }
