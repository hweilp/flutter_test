import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';
import 'package:flutterproject/compontents/toast.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _pageTitle = '注册';

  final TextEditingController accountController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController checkPasswordController =
      new TextEditingController();

  static bool isChinaPhoneLegal(String str) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }

  void register() async {
    var userMobile = accountController.text;
    var password = passwordController.text;
    var checkPassword = checkPasswordController.text;
    if (userMobile == null || userMobile == '') {
      Toast.toast(context, '请输入手机号码！');
      return;
    }
    if (!isChinaPhoneLegal(userMobile)) {
      Toast.toast(context, '手机号码格式错误！');
      return;
    }
    if (password == null || password == '') {
      Toast.toast(context, '请输入密码！');
      return;
    }
    if (checkPassword == null || checkPassword != password) {
      Toast.toast(context, '两次密码输入不一致！');
      return;
    }
    var data = {
      'userMobile': userMobile,
      'password': password,
    };
    var resultData = await ApiInterface.register(data).then((res) {
      return res.data;
    });
    var code = resultData['code'];
    var message = resultData['msg'];
    if (code == 2000) {
      Toast.toast(context, message);
      Navigator.of(context).pushNamed('/login');
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
                textFiledCon(accountController, '请输入手机号码', false,
                    new Icon(Icons.account_circle, color: Colors.grey)),
                textFiledCon(passwordController, '请输入密码', true,
                    new Icon(Icons.lock, color: Colors.grey)),
                textFiledCon(checkPasswordController, '确认密码', true,
                    new Icon(Icons.lock, color: Colors.grey)),
                //
                new RaisedButton(
                  child: new Text('确 定'),
                  color: Colors.blue,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  textColor: Colors.white,
                  onPressed: () {
                    register();
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
