import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';
import 'package:flutterproject/util/sharedPreferences.dart';
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
    var userName = accountController.text;
    var password = passwordController.text;
    print('userName===$userName, password===$password');
    if (userName == null || userName == '') {
      Toast.toast(context, '请输入账号');
      return;
    }
    if (password == null || password == '') {
      Toast.toast(context, '请输入密码');
      return;
    }
    var data = {
      'userName': userName,
      'password': password,
    };
    ApiInterface.login(data).then((res) {
      // Navigator.pop(context);
      // Navigator.of(context).pushNamed('/');
      // 返回给上一个页面
      Navigator.of(context).pop();
      var msg = '账号密码错误';
      print('res====$res');

      // var codes = res['code'];
      // print('res====$res, msg===$msg, codes===$codes');
      var code = 2001;
      print('res====$res, msg===$msg, code=$code');
      Shared.sharedSaveString('auth_token', 'vavadfadfadsfa');
      Toast.toast(context, msg);
    });
    // .catchError((onError) => {Toast.toast(context, '网络异常')});
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
                textFiledCon(accountController, '请输入账号', false,
                    new Icon(Icons.account_circle, color: Colors.grey)),
                textFiledCon(passwordController, '请输入密码', true,
                    new Icon(Icons.lock, color: Colors.grey)),
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

Widget textFiledCon(TextEditingController controller,
    [String hintText, bool obscureText, Icon prefixIcon]) {
  return new Container(
    height: 45,
    padding: new EdgeInsets.fromLTRB(0, 1, 10, 0),
    margin: new EdgeInsets.fromLTRB(10, 10, 10, 10),
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
      border: Border.all(width: 1, color: Colors.grey),
    ),
    child: TextField(
      controller: controller,
      // keyboardType: TextInputType.number,
      // 密码格式
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        // prefixIcon: new Icon(Icons.account_circle, color: Colors.grey),
        prefixIcon: prefixIcon,
        contentPadding:
            EdgeInsets.only(left: 0.0, top: 10.0, right: 5.0, bottom: 0.0),
      ),
    ),
  );
}
