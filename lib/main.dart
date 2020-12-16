import 'package:flutter/material.dart';//导入包  此行代码作用是导入了Material UI组件库
import 'package:flutter_app/router/Routes.dart';

/*
 应用程序的入口。main函数中调用了runApp 方法，
 它的功能是启动Flutter应用。runApp它接受一个Widget参数
 */
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  /*
  *在Flutter中，大多数东西都是widget（后同“组件”或“部件”），包括对齐(alignment)、填充(padding)和布局(layout)等，它们都是以widget的形式提供
  * widget的主要工作是提供一个build()方法来描述如何构建UI界面
  * */
  Widget build(BuildContext context) {
    /*
    *MaterialApp 是Material库中提供的Flutter APP框架，
    * 通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget
    * */
    return new MaterialApp(
      title: 'Flutter Demo',//应用的名称
      theme: new ThemeData(
        primaryColor:Color(0xFF5BCD35)//主题
      ),
      initialRoute: '/',//初始路由
      onGenerateRoute:onGenerateRoute,
      debugShowCheckedModeBanner:false,//去除右上角的debug标签
    );
  }
}


