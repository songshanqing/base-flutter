import 'package:flutter/cupertino.dart';

//TODO:https://blog.csdn.net/u013894711/article/details/102782366
class TestProvider extends ChangeNotifier{
  String _test="测试provider初始化";//初始化test

  String get test=>_test;//提供一个get方法

  void setTest(){//改变test
    _test="改后得provider";
    notifyListeners();// 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
  }
}