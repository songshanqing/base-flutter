import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

// TODO:https://github.com/flutterchina/dio
// ignore: camel_case_types
class http{

  static BaseOptions options=BaseOptions(
      baseUrl:'http://report.secton.cn',
      connectTimeout:300000,//连接服务器超时时间，单位是毫秒
      receiveTimeout:300000,//接收数据的最长时限
      /*
        请求的Content-Type，默认值是"application/json; charset=utf-8".
        如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
         可以设置此选项为 `Headers.formUrlEncodedContentType`,
      */
      contentType:"application/json;charset=utf-8",
      responseType:ResponseType.json//定制接收的数据类型
  );
  static final Dio dio =Dio(options);//创建dio实例

  /*
    * 请求路径，如果 `path` 以 "http(s)"开始, 则 `baseURL` 会被忽略；
    * 否则,将会和baseUrl拼接出完整的的url
  */
  // ignore: missing_return
  static request(String path,{data,Map params,Options options}) async{//可选参数写在{}里面

      dio.interceptors.add(InterceptorsWrapper(// 拦截器
          onRequest:(RequestOptions options){// 在请求被发送之前做一些事情
            print("options:$options");
            return options; //continue
          },
          onResponse:(Response response) {// 在返回响应数据之前做一些预处理
            // print("response:$response");
            return response; // continue
          },
          onError: (DioError e){// 当请求失败时做一些预处理
            print("DioError:$e");
            return e;//continue
          }
      ));

      // 设置Http代理
      // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      //     (client) {
      //   client.findProxy = (uri) {
      //     //proxy all request to localhost:8888
      //     return "PROXY http://192.168.0.59:8888";
      //   };
      //   //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
      //   client.badCertificateCallback =
      //       (X509Certificate cert, String host, int port) => true;
      // };

      //发送网络请求
      try{
        Response response;
        if(data!=null){//post请求传了参数
          response = await dio.request(path,data:data,options: options);
        }else if(params!=null){//get请求传了参数
          response = await dio.request(path,queryParameters:params,options: options);
        }else{//没有传参数
          response = await dio.request(path,options: options);
        }
        return response;
      }on DioError catch(e){
        return Future.error(e);
      }
  }


  //post封装
  static post(path,{params}) async{
    if(params!=null){//传了参数
      return await request(path,data:params,options: Options(method: "POST"));
    }else{//没有传参
      return await request(path,options: Options(method: "POST"));
    }

  }

  //get封装
  static get(path,{params}) async{
    if(params!=null){//传了参数
      return await request(path,params:params,options: Options(method: "GET"));
    }else{//没有传参
      return await request(path,options: Options(method: "GET"));
    }

  }

}



