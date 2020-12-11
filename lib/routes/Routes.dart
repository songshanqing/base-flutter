import 'package:flutter/material.dart';
import '../pages/Tabs/Tabs.dart';
import '../pages/Login/Login.dart';
// 定义路由
final  routeTable = {
  '/' : (context) => Tabs(),//不用传参的写法
  '/login' : (context) => LoginPage(),
  // '/sign': (context, {arguments}) => SignPage(arguments: arguments),//需要传参的写法
};

//路由拦截
// ignore: top_level_function_literal_block, missing_return
final onGenerateRoute=(RouteSettings settings){
  final String routeName = settings.name;
  final Function pageBuilder=routeTable[routeName];
  if (pageBuilder != null) {//路由存在
    // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
    // 引导用户登录；其它情况则正常打开路由。
    if (settings.arguments != null) {// 如果透传了参数
      /*
      * MaterialPageRoute 是Material组件库提供的组件，
      * 它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画：
      * */
      return MaterialPageRoute(
          builder: (context) =>
              pageBuilder(context, arguments: settings.arguments));
    } else {// 没有透传参数
      return MaterialPageRoute(builder: (context) => pageBuilder(context));
    }
  }
};