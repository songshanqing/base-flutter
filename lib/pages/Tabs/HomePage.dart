import 'package:flutter/material.dart';
import 'package:flutter_app/service/request.dart';

class HomePage extends StatefulWidget{//有状态的组件
  @override
  _HomePageState createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage>{
  void getHttp() async {
    try {
      const params={"pageNumber":1,"rowNumber":5};
      final response=await http.post("/personObservationReport/list",params:params);
      // print("response:.$response");
      print(response.data);
      print(response.headers);
      print(response.request);
      print(response.statusCode);
    } catch (e) {
      print("e:$e");
    }
  }
  @override
  Widget build(BuildContext context){
    /*
    * Scaffold 是 Material 库中提供的页面脚手架，
    * 它提供了默认的导航栏、标题和包含主屏幕widget树（后同“组件树”或“部件树”）的body属性
    * */
    return Scaffold(
      appBar:AppBar(//导航栏
          title:Text('首页')//导航栏标题
      ),
      body:RaisedButton(
        child: Text("normal"),
        onPressed: () {
          // this.getHttp();
          // Navigator.pushNamed(context, '/login');
          this.getHttp();
        },
      )
    );
  }
}
