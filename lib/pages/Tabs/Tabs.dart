import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'TestPage.dart';
import '../Drawer/Drawer.dart';
class Tabs extends StatefulWidget{
  @override
  _TabsState createState()=>_TabsState();
}
class _TabsState  extends State<Tabs>{
  int _currentIndex=0;
  List _pageList=[//把页面放在数组中
    HomePage(),
    TestPage()
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:this._pageList[this._currentIndex],
      drawer:MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar(//底部导航栏
        currentIndex: this._currentIndex,//默认选中第几项
        onTap: (int index){//导航栏点击获取索引值
          /*
          *setState方法的作用是通知Flutter框架，有状态发生了改变，
          * Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面
          * */
          setState(() {
            this._currentIndex=index;
          });
        },
        fixedColor: Color(0xFF5BCD35),//选中文字颜色
        unselectedItemColor:Color(0xFF626A7D),//未选择文字颜色
        selectedFontSize:16,//选中字体大小
        unselectedFontSize: 16,//未选中字体大小
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Image.asset("images/home.png",width:22),
              activeIcon:Image.asset("images/home_active.png",width:22),
              // ignore: deprecated_member_use
              title:Text('首页')
          ),
          BottomNavigationBarItem(
              icon:Image.asset("images/test.png",width:22),
              activeIcon:Image.asset("images/test_active.png",width:22),
              // ignore: deprecated_member_use
              title:Text('测试')
          )
        ]
      ),
    );
  }
}