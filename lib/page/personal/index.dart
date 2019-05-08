import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的',
          style: TextStyle(color: Colors.white),
        ),
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

  Widget _orderInfo(BuildContext context) {
    return new Container(
      // height: 120,
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
