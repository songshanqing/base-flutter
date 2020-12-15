import 'package:dio/dio.dart';

//TODO:https://github.com/flutterchina/dio
BaseOptions options=new BaseOptions(
  baseUrl:'',
  connectTimeout:5000,//连接服务器超时时间，单位是毫秒
  receiveTimeout:100000,//接收数据的最长时限
  headers: {
    'Content-Type': 'application/json; charset=utf-8'
  }
);
Dio dio =Dio(options);//创建dio实例

class CustomInterceptors extends InterceptorsWrapper {// 拦截器
  @override
  Future onRequest(RequestOptions options) async{//在发送请求之前做一些事情
    print('$options');
    // dio.interceptors.requestLock.lock();//锁定拦截器
    // Response response = await dio.get("/token");
    // options.headers["token"] = response.data["data"]["token"];
    // dio.interceptors.requestLock.unlock();//解锁拦截器
    return super.onRequest(options);
  }
  @override
  Future onResponse(Response response) {//响应成功后
    print("RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }
  @override
  Future onError(DioError err) {//响应错误后
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}

//设置Http代理
// (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
//   client.findProxy = (uri) {
//     return "PROXY localhost:8888";
//   };
// };

