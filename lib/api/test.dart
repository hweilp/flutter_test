import 'package:dio/dio.dart';

// get() async {
//   Dio dio = new Dio();
//   var response = await dio.get("http://127.0.0.1:8080/test");
//   return response;
// }

class Http {
  static final host = 'http://127.0.0.1:8080';

  static BaseOptions options = new BaseOptions(
      method: 'get',
      baseUrl: host,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      followRedirects: true);
  static Dio dio = new Dio(options);

  // dio.interceptors.add()

  static request(String uri, String method,
      [Map<String, dynamic> data, bool dataIsJson = true]) async {
    var _uri = host + uri;
    var response = await dio.request(_uri);
    return response;
  }
}
