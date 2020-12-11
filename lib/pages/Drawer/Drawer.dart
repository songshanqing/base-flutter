import 'package:flutter/material.dart';
// ignore: must_be_immutable
class MyDrawer extends StatelessWidget{
  List listData=[// 自定义Json数据
    {
      "icon":Icons.color_lens,
      "title":"换肤"
    },
    {
      "icon":Icons.language,
      "title":"语言"
    },
    {
      "icon":Icons.power_settings_new,
      "title":"注销"
    }
  ];
  @override
  Widget build(BuildContext context){
    return Drawer(
      child:MediaQuery.removePadding(
        context: context,
        removeTop: true,//移除抽屉菜单顶部默认留白
        child:Column(
          /*
           在Row（水平排列）控件中，CrossAxisAlignment的方向就是垂直的，在 Column（垂直排列）控件中，CrossAxisAlignment的方向就是水平的。
           CrossAxisAlignment.start 将子控件放在交叉轴的起始位置
          */
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: <Widget>[
            _buildHeader(), //构建抽屉菜单头部
            Expanded(child: _buildMenus()), //构建功能菜单
          ],
        )
      )
    );
  }
  //构建头部
  Widget _buildHeader(){
    return Container(
        decoration: BoxDecoration(//背景装饰
          color:Color(0xFF5BCD35),
        ),
      padding:const EdgeInsets.only(top:45,bottom:12),//可以设置具体某个方向的填充(可以同时指定多个方向)。
     child:Row(
       children:<Widget>[
         Padding(
           padding:const EdgeInsets.symmetric(horizontal: 16.0),//用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。
           child:ClipOval(//如果 child 为正方形时剪裁之后是圆形，如果 child 为矩形时，剪裁之后为椭圆形
               child:Image.asset("images/head_sculpture.jpg",width:70)
           ),
         ),
         Text("用户名",
          style:TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.bold,
             color:Color(0xFFFFFFFF)
         )
        )
       ],
     )
    );
  }

  // 构建菜单项
  Widget _buildMenus(){
    return ListView(
      children:this.getData(),
    );
  }

  //遍历
  List<Widget> getData() {
    var tempList = listData.map((value){
      return ListTile(
          leading: Icon(value["icon"]),
          title: Text(value["title"],
            style:TextStyle(
              fontSize:16
            )
          ),
        //点击获取索引值
        onTap:()=>debugPrint(value)
      );
    });
    return tempList.toList();
  }
}

