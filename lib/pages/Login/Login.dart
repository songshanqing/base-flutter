import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>_LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   title:Text('登录')
      // ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal:30.0),
          margin:EdgeInsets.only(top:100),
        child:Column(
          children:<Widget> [
            Text("用户登录",
                style:TextStyle(
                  fontSize: 20,
                  color:Color(0xFF333333),
                )
            ),
            Expanded(child:_buildInput())//构建input功能界面
          ],
        )
      )
    );
  }
}

//构建input功能界面
// ignore: missing_return
Widget _buildInput(){
  //定义一个controller
  TextEditingController _user = TextEditingController();//获取用户名
  TextEditingController _password = TextEditingController();//获取密码
  _user.addListener((){//监听用户名输入变化
    print(_user.text);
  });
  return Container(
    margin:EdgeInsets.only(top:100),
      decoration: BoxDecoration(
        // 下滑线浅灰色，宽度1像素
          border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
      ),
    child:Column(
      children: [
        TextField(
          decoration:InputDecoration(
              hintText:"请输入用户名",
              prefixIcon:Image.asset("images/login/user.png",width:19),
          ),
          controller:_user,//编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件
        ),
        TextField(
          decoration:InputDecoration(
              hintText:"请输入密码",
              prefixIcon:Image.asset("images/login/password.png",width:19),
          ) ,
          obscureText: true,//是否隐藏正在编辑的文本，文本内容会用“•”替换
          controller:_password
        )
      ],
    )
  );
}