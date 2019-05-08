import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';
import 'package:flutterproject/util/sharedPreferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  String userName = '';
  // String userAvatar = '';
  String userAvatar = 'http://127.0.0.1:8080/static/images/3.png';
  // AppState appState;
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getUserInfo();
    super.didChangeDependencies();
  }

  void getUserInfo() async {
    String sharedUserName = await Shared.sharedGetString('user_name');
    String sharedUserAvatar = await Shared.sharedGetString('user_avatar');
    if (sharedUserName != null && sharedUserName != 'null') {
      setState(() {
        userName = sharedUserName;
        userAvatar = sharedUserAvatar;
      });
    }
  }

  void loginout() {
    ApiInterface.loginout().then((data) {
      setState(() {
        userName = '';
        userAvatar = '';
      });
      Shared.sharedClear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: new RaisedButton(
        //   onPressed: () {
        //     print('leading');
        //   },
        //   child: new Icon(Icons.local_cafe),
        //   textColor: Colors.white,
        //   color: Color.fromRGBO(2, 2, 2, 0),
        //   elevation: 0.0,
        //   disabledElevation: 0.0,
        //   highlightElevation: 0.0,
        //   // colorBrightness: Brightness.light,
        //   // splashColor: Colors.red,
        //   padding: const EdgeInsets.all(5.0),
        // ),
        title: Text(
          '我的',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          new Container(
            width: 50.0,
            margin: const EdgeInsets.only(
              left: 5.0,
              right: 5.0,
            ),
            alignment: Alignment.center,
            child: new IconButton(
              icon: new Image.asset('assets/images/login_out.png',
                  width: 24.0, height: 24.0, repeat: ImageRepeat.repeat),
              color: Colors.white,
              onPressed: () {
                loginout();
              },
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              //
              _mineTop(context),
              // 订单信息
              _orderInfo(context)
            ],
          )),
    );
  }

  Widget _mineTop(BuildContext context) {
    if (userName != '') {
      return new Container(
        height: 100,
        margin: EdgeInsets.only(top: 0, right: 0, bottom: 15, left: 0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              offset: Offset(1.2, 1.2),
              color: Color.fromRGBO(165, 165, 165, .1),
              spreadRadius: 1.5,
            )
          ],
        ),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Center(
              child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: new Text(
                  userName,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Expanded(
                flex: 1,
                child: new Image.network(userAvatar),
                // child: new Image.network(userAvatar),
                // child: new Row(
                //   children: <Widget>[
                //     Image.network(userAvatar),
                //     // Image.asset('assets/images/login_out.png',
                //     //     width: 24.0, height: 24.0, repeat: ImageRepeat.noRepeat)
                //   ],
                // ),
              )
            ],
          )),
        ),
      );
    } else {
      return new Container(
        margin: EdgeInsets.only(top: 0, right: 0, bottom: 15, left: 0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              offset: Offset(1.2, 1.2),
              color: Color.fromRGBO(165, 165, 165, .1),
              spreadRadius: 1.5,
            )
          ],
        ),
        child: new Container(
          height: 130,
          color: Colors.white,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  '注册',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
              ),
              Text(
                '|',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              FlatButton(
                child: Text(
                  '登录',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _orderInfo(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            offset: Offset(1.2, 1.2),
            color: Color.fromRGBO(165, 165, 165, .1),
            spreadRadius: 1.5,
          )
        ],
      ),
      child: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      '订单信息',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Text('查看全部订单'),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 18,
                              ),
                            ],
                          ),
                          onTap: () {
                            print('查看更多GestureDetector');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: new BorderSide(width: 1, color: Colors.grey))),
              padding: EdgeInsets.only(top: 15, right: 0, bottom: 15, left: 0),
              child: Flex(direction: Axis.horizontal, children: <Widget>[
                Expanded(
                  flex: 1,
                  child: new GestureDetector(
                    onTap: () {
                      print('待付款');
                    },
                    child: Container(
                      child: new Center(
                        child: new Column(
                          children: <Widget>[
                            Icon(
                              Icons.account_balance_wallet,
                              color: Colors.lightBlue,
                            ),
                            Text('待付款')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: new GestureDetector(
                    onTap: () {
                      print('待发货');
                    },
                    child: Container(
                      child: new Center(
                        child: new Column(
                          children: <Widget>[
                            Icon(
                              Icons.business,
                              color: Colors.lightBlue,
                            ),
                            Text('待发货')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: new GestureDetector(
                    onTap: () {
                      print('待收货');
                    },
                    child: Container(
                      child: new Center(
                        child: new Column(
                          children: <Widget>[
                            Icon(
                              Icons.directions_bus,
                              color: Colors.lightBlue,
                            ),
                            Text('待收货')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: new GestureDetector(
                    onTap: () {
                      print('待评价');
                    },
                    child: Container(
                      child: new Center(
                        child: new Column(
                          children: <Widget>[
                            Icon(
                              Icons.event_busy,
                              color: Colors.lightBlue,
                            ),
                            Text('待评价')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: new GestureDetector(
                    onTap: () {
                      print('退款/售后');
                    },
                    child: Container(
                      child: new Center(
                        child: new Column(
                          children: <Widget>[
                            Icon(
                              Icons.receipt,
                              color: Colors.lightBlue,
                            ),
                            Text('退款/售后')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
