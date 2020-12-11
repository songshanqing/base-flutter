import 'package:dio/dio.dart';

//TODO:https://github.com/flutterchina/dio
BaseOptions options=new BaseOptions(
  baseUrl:'',
  connectTimeout:5000,//连接超时的时间
  receiveTimeout:3000,//接受超时时间
  headers: {
    'Content-Type': 'application/json;charset=UTF-8'
  }
);
Dio dio = new Dio(options);//创建dio实例

class CustomInterceptors extends InterceptorsWrapper {// 拦截器
  @override
  Future onRequest(RequestOptions options) {//在发送请求之前做一些事情
    print('$options');
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

