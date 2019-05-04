import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';
// import 'package:flutterproject/api/test.dart';
// import 'package:carousel/carousel.dart';

class MotherRingPage extends StatelessWidget {
  final _pageTitle = '妈妈圈';
  void initState() {
    // ApiInterface.apiTest();
    ApiInterface.test().then((data) => {print(data)});
    // Http.request('/test', 'get').then((data) => {print('data=== $data')});
  }

  void login() {
    var data = {'userName': 'admin', 'password': '123456'};
    ApiInterface.login(data)
        .then((data) => {print(data)})
        .catchError((onError) => {print(onError)});
  }

  void getList() {}

  @override
  Widget build(BuildContext context) {
    // initState();
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
          crossAxisAlignment: CrossAxisAlignment.end,
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
            IconButton(
              icon: Icon(Icons.account_box),
              onPressed: () {
                print('23');
                login();
              },
            ),
            IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () {
                print(' 正在打印 list 1');
                initState();
              },
            )
          ],
        ));
  }
}
