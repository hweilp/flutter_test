import 'package:flutter/material.dart';
import 'package:flutterproject/page/ybl/index.dart';
import 'package:flutterproject/page/mamaring/index.dart';
import 'package:flutterproject/page/vip/index.dart';
import 'package:flutterproject/page/cart/index.dart';
import 'package:flutterproject/page/personal/index.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  final _tabTitleColor = Colors.black;
  final _tabActiveTitleColor = Colors.green;
  final _tabTitleList = ['雅布力', '妈妈圈', 'VIP', '购物车', '我的'];
  final _tabIconList = [
    'assets/images/tab_bookshelf_n.png',
    'assets/images/tab_bookstore_n.png',
    'assets/images/tab_writer_n.png',
    'assets/images/tab_bookshelf_n.png',
    'assets/images/tab_me_n.png',
  ];
  final _tabActiveIconList = [
    'assets/images/tab_bookshelf_p.png',
    'assets/images/tab_bookstore_p.png',
    'assets/images/tab_writer_p.png',
    'assets/images/tab_bookshelf_p.png',
    'assets/images/tab_me_p.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          YBLPage(),
          MotherRingPage(),
          VIPPage(),
          CartPage(),
          PersonalPage()
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: getTabImage(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabImage(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(
              icon: getTabImage(2), title: getTabTitle(2)),
          new BottomNavigationBarItem(
              icon: getTabImage(3), title: getTabTitle(3)),
          new BottomNavigationBarItem(
              icon: getTabImage(4), title: getTabTitle(4))
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabImage(int index) {
    var path =
        index == _tabIndex ? _tabActiveIconList[index] : _tabIconList[index];
    return new Image.asset(path,
        width: 24.0, height: 24.0, repeat: ImageRepeat.repeat);
  }

  Text getTabTitle(int index) {
    var color = index == _tabIndex ? _tabActiveTitleColor : _tabTitleColor;
    return new Text(_tabTitleList[index],
        style: new TextStyle(fontSize: 14.0, color: color));
  }
}
