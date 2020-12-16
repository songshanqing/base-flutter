import 'package:dio/dio.dart';

// TODO:https://github.com/flutterchina/dio

/*
 * 请求路径，如果 `path` 以 "http(s)"开始, 则 `baseURL` 会被忽略；
 *否则,将会和baseUrl拼接出完整的的url
 */
// ignore: missing_return
Future request(String path,data,Options option){
  BaseOptions options=BaseOptions(
      baseUrl:'http://report.secton.cn/api',
      connectTimeout:5000,//连接服务器超时时间，单位是毫秒
      receiveTimeout:100000,//接收数据的最长时限
      headers: {
        'Content-Type': 'application/json; charset=utf-8'
      }
  );
  Dio dio =Dio(options);//创建dio实例
  // if(path.length!=0){
  //   options.path=path
  // }
  dio.interceptors.add(InterceptorsWrapper(// 拦截器
      onRequest:(RequestOptions options) async {
        print("options:$options");
        // 在请求被发送之前做一些事情
        return options; //continue
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse:(Response response) async {
        print("response:$response");
        // 在返回响应数据之前做一些预处理
        return response; // continue
      },
      onError: (DioError e) async {
        print("DioError:$e");
        // 当请求失败时做一些预处理
        return e;//continue
      }
  ));
}


// // 设置Http代理
// (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
// (client) {
// client.findProxy = (uri) {
// //proxy all request to localhost:8888
// return "PROXY http://report.secton.cn";
// };
// //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
// client.badCertificateCallback =
// (X509Certificate cert, String host, int port) => true;
// };

