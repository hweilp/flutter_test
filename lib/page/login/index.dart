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
    // print('userName===$userName, password===$password');
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
    var resultData = await ApiInterface.login(data).then((res) {
      return res.data;
    });
    var code = resultData['code'];
    var message = resultData['msg'];
    var authToken = resultData['data']['auth_token'];
    var resultUserName = resultData['data']['userName'];
    var resultUserAvatar = resultData['data']['userAvatar'];
    if (code == 2000) {
      Shared.sharedSaveString('auth_token', authToken);
      Shared.sharedSaveString('user_name', resultUserName);
      Shared.sharedSaveString('user_avatar', resultUserAvatar);
      Toast.toast(context, message);
      // mine
      // Navigator.of(context).pushNamed('/mine');
      Navigator.of(context).pop();
    } else {
      Toast.toast(context, message);
    }
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
