import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier{
  UserModel(this.token,this.userInformation);
  String token="";//声明token
  Object userInformation={};//定义用户信息

  void setToken(param){//改变token
    token=param;
    notifyListeners();// 通知监听器，重新构建InheritedProvider， 更新状态。
  }
}