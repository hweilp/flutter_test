import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';

class VIPPage extends StatefulWidget {
  // static getBaner() async {
  //   var data = await ApiInterface.getVipBanner().then((res) {
  //     return res.data;
  //   });
  //   print('data===$data');
  // }

  @override
  State<StatefulWidget> createState() => new VIPPageState();
}

class VIPPageState extends State<VIPPage> {
  final _pageTitle = 'VIP';
  int count = 1;

  @override
  void initState() {
    // 整个App初始化
    print('initState');
    super.initState();
    getBanner();
  }

  void changeState() {
    setState(() {
      count = 2;
    });
  }

  void getBanner() async {
    var data = await ApiInterface.getVipBanner().then((res) {
      return res.data;
    });
    print('data===$data');
  }

  @override
  Widget build(BuildContext context) {
    // getBanner();
    return new Scaffold(
        appBar: AppBar(
          title: Text(_pageTitle),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                print('object');
              },
            )
          ],
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Text(_pageTitle),
            Text(count.toString()),
            // Int(count),
            IconButton(
              icon: Icon(Icons.accessible_forward),
              onPressed: () {
                changeState();
                print(' 正在打印 list 1');
              },
            ),
            Text('getbanner'),
            IconButton(
              icon: Icon(Icons.accessible_forward),
              onPressed: () {
                getBanner();
                print(' 正在打印 list 1');
              },
            ),
            IconButton(
              tooltip: 'login',
              icon: Icon(Icons.accessible_forward),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
            )
          ],
        ));
  }
}
