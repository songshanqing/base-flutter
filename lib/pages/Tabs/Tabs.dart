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
  var _pageController = new PageController(
      initialPage: 0//用来配置PageView中默认显示的页面 从0开始
  );
  void _pageChange(int index){
    setState(() {
      this._currentIndex=index;
    });
  }
  void _onItemTapped(int index){
    //bottomNavigationBar 和 PageView 关联
    _pageController.animateToPage(
        index,//子Widget的索引
        duration: const Duration(milliseconds: 300), //滚动时间
        curve: Curves.ease//动画曲线
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // body:this._pageList[this._currentIndex],
      body:new PageView.builder(//滑动切换
          onPageChanged: _pageChange,//页面改变监听
          controller:_pageController,//页面控制器
          itemCount:_pageList.length,//页面数量
          itemBuilder: (BuildContext context, int index) {//页面加载器
              return this._pageList[this._currentIndex];
          },
      ),
      drawer:MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar(//底部导航栏
        currentIndex: this._currentIndex,//默认选中第几项
        onTap:_onItemTapped,//点击
        fixedColor: Color(0xFF5BCD35),//选中文字颜色
        unselectedItemColor:Color(0xFF626A7D),//未选择文字颜色
        selectedFontSize:14,//选中字体大小
        unselectedFontSize: 14,//未选中字体大小
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Image.asset("images/tabs/home.png",width:17),
              activeIcon:Image.asset("images/tabs/home_active.png",width:17),
              // ignore: deprecated_member_use
              title:Text('首页')
          ),
          BottomNavigationBarItem(
              icon:Image.asset("images/tabs/test.png",width:17),
              activeIcon:Image.asset("images/tabs/test_active.png",width:17),
              // ignore: deprecated_member_use
              title:Text('测试')
          )
        ]
      ),
    );
  }
}