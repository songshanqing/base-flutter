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
        margin:EdgeInsets.only(top:60),
        child:Column(
          children:<Widget> [
            Text("用户登录",
                style:TextStyle(
                  fontSize: 20,
                  color:Color(0xFF333333),
                )
            ),
            _buildInput()//构建input功能界面
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
  GlobalKey _formKey= new GlobalKey<FormState>();
  _user.addListener((){//监听用户名输入变化
    print(_user.text);
  });
  return Container(
    margin:EdgeInsets.only(top:60),
    child:Form(
        key: _formKey, //设置globalKey，用于后面获取FormState
        // ignore: deprecated_member_use
        autovalidate: true, //开启自动校验
        child:Column(
          children: [
            Container(
              height:44,
              child:TextFormField(
                decoration:InputDecoration(
                  hintText:"请输入用户名",
                  hintStyle:TextStyle(color:Colors.grey,fontSize: 14),
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: UnderlineInputBorder(//获得焦点边框颜色
                      borderSide: BorderSide(color:Colors.grey,width:1)
                  ),// 未获得焦点,去除边框
                  focusedBorder:UnderlineInputBorder(//获得焦点边框颜色
                      borderSide: BorderSide(color:Color(0xFF5BCD35),width:1)
                  ),
                ),
                controller:_user,//编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件
                validator: (v) {
                  return v
                      .trim()
                      .length > 0 ? null : "用户名不能为空";
                }
              ),
            ),
            Container(
                height:44,
                margin:EdgeInsets.only(top:20,bottom:30),
                child:TextFormField(
                    decoration:InputDecoration(
                      hintText:"请输入密码",
                      hintStyle:TextStyle(color:Colors.grey,fontSize: 14),
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder:UnderlineInputBorder(//获得焦点边框颜色
                          borderSide: BorderSide(color:Colors.grey,width:1)
                      ),// 未获得焦点,去除边框
                      focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color:Color(0xFF5BCD35),width:1)
                      ),
                    ) ,
                    obscureText: true,//是否隐藏正在编辑的文本，文本内容会用“•”替换
                    controller:_password
                )
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin:Alignment.topLeft,
                  end:Alignment.bottomRight,
                  colors: [Color(0xFF72E585),Color(0xFF5BCD35)]
                )
              ),
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal:30.0),
                child: Row(
                    children: <Widget>[
                      Expanded(
                          child:FlatButton(
                              child:Text("登录",style:TextStyle(
                                  color:Colors.white,
                                  fontSize: 18
                              ))
                          )
                      )
                    ]
                ),
              )

            )
          ],
        )
    )

  );
}