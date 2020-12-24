import 'package:dio/dio.dart';
import 'package:flutter_app/service/request.dart';
class TestApi{
  // ignore: non_constant_identifier_names
  static List(params) async{
      return await http.request(
          "/personObservationReport/list",
          data:params,
          options: Options(method: "POST")
      );
  }
}