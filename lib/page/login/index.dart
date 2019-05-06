import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';
import 'package:flutterproject/compontents/toast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _pageTitle = '登录';

  final TextEditingController accountController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  void login() async {
    var data = {
      'userName': accountController.text,
      'password': passwordController.text,
    };
    ApiInterface.login(data).then((res) {
      var msg = '账号密码错误';
      // var code = res.code;
      var code = 2001;
      print('res====$res, msg===$msg, code=$code');
      Toast.toast(context, msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(_pageTitle),
        ),
        body: new Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          margin: EdgeInsets.fromLTRB(5, 10, 5, 30),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  height: 45,
                  padding: new EdgeInsets.fromLTRB(0, 1, 10, 0),
                  margin: new EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(5.0)),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: TextField(
                    controller: accountController,
                    // keyboardType: TextInputType.number,
                    // 密码格式
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '请输入账号',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon:
                          new Icon(Icons.account_circle, color: Colors.grey),
                      contentPadding: EdgeInsets.only(
                          left: 0.0, top: 10.0, right: 5.0, bottom: 0.0),
                    ),
                  ),
                ),
                new Container(
                  height: 45,
                  padding: new EdgeInsets.fromLTRB(0, 1, 10, 0),
                  margin: new EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(5.0)),
                  ),
                  child: TextField(
                    controller: passwordController,
                    // keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: new Icon(Icons.lock, color: Colors.grey),
                      prefixStyle: TextStyle(),
                      hintText: '请输入密码',
                      alignLabelWithHint: false,
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.only(
                          left: 0.0, top: 10.0, right: 5.0, bottom: 0.0),
                    ),
                  ),
                ),
                new RaisedButton(
                  child: new Text('确 定'),
                  color: Colors.blue,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  textColor: Colors.white,
                  onPressed: () {
                    login();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
