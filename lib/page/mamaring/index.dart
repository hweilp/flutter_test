import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';
import 'package:flutterproject/util/sharedPreferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MotherRingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MotherRingPageState();
}

class _MotherRingPageState extends State {
  var _pageTitle = '妈妈圈';
  var userName = '';
  void init() {
    var data = {'token': '232323'};
    ApiInterface.test(data).then((data) => {print('data===$data')});
  }

  void loginout() {
    ApiInterface.loginout().then((data) {
      setState(() {
        userName = '';
      });
      Shared.sharedClear();
    });
  }

  login() async {
    var data = {'userName': 'admin', 'password': '123456'};
    // var authToken = '223232323userName';
    ApiInterface.login(data).then((res) {
      Shared.sharedSaveString('auth_token', 'vavadfadfadsfa');
      setState(() {
        userName = data['userName'];
      });
    }).catchError((onError) => {print(onError)});
  }

  void getList() {
    ApiInterface.userList().then((data) => {print('userlist === $data')});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(_pageTitle),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                print('object');
                // Navigator.pushNamed(context, 'home_page');
              },
            )
          ],
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            // new SizedBox(
            //   height: 240.0,
            //   child: new Carousel(
            //     children: [
            //       new NetworkImage(
            //           'https://pbs.twimg.com/profile_images/760249570085314560/yCrkrbl3_400x400.jpg'),
            //       new NetworkImage(
            //           'https://webinerds.com/app/uploads/2017/11/d49396_d9c5d967608d4bc1bcf09c9574eb67c9-mv2.png')
            //     ].map((netImage) => new Image(image: netImage)).toList(),
            //   ),
            // ),
            Text(_pageTitle),
            Text('用户名：$userName'),
            Text('登录'),
            IconButton(
              icon: Icon(Icons.work),
              onPressed: () {
                login();
              },
            ),
            Text('测试'),
            IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () {
                init();
              },
            ),
            Text('获取列表'),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                getList();
              },
            ),
            Text('退出'),
            IconButton(
              icon: Icon(Icons.local_gas_station),
              onPressed: () {
                loginout();
              },
            ),
          ],
        ));
  }
}
