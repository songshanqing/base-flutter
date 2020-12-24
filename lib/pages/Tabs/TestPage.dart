import 'package:flutter/material.dart';
import 'package:flutter_app/common/Api/TestApi.dart';
import 'package:flutter_app/states/Test/TestProvider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget{
  @override
  _TestPageState createState()=>_TestPageState();
}
class _TestPageState extends State<TestPage>{
  void getHttp() async {
    try {
      const params={"pageNumber":1,"rowNumber":5};
      final response=await TestApi.List(params);
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
    //1.在build方法里获取到在程序入口(main.dart)初始化的UserProvider
    TestProvider testProvider = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar:AppBar(
        title:Text('测试')
      ),
      body:Center(
        child:Column(
         children: [
           Text("测试页面",style:TextStyle(
             color:Colors.deepOrange,
             fontSize: 20.0,
             fontWeight:FontWeight.bold
           )),
           FlatButton(
            child:Text("跳转至登录页面"),
             onPressed: (){
              Navigator.pushNamed(context, "/login");
             },
           ),
           RaisedButton(
             child: Text("测试接口"),
             onPressed: () {
               // this.getHttp();
               // Navigator.pushNamed(context, '/login');
               this.getHttp();
             },
           ),
          Text(
            "TestProvider:${testProvider.test}"
          )
         ],
        )
      )
    );
  }
}