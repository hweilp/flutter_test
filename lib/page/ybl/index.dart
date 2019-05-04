import 'package:flutter/material.dart';
import 'package:flutterproject/compontents/loading.dart';
import 'package:flutterproject/compontents/toast.dart';

class YBLPage extends StatelessWidget {
  final _pageTitle = '雅布力';
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
              },
            )
          ],
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Center(
                child: new FlatButton(
                  child: Text('显示弹窗'),
                  color: Color.fromRGBO(64, 158, 255, 1),
                  textColor: Color.fromRGBO(255, 255, 255, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: BorderSide(
                          color: Color.fromRGBO(64, 158, 255, 1), width: 1)),
                  onPressed: () {
                    showAlterDialog(context);
                  },
                ),
              ),
              new Center(
                child: new FlatButton(
                  child: Text('显示Loading弹窗'),
                  color: Color.fromRGBO(64, 158, 255, 1),
                  textColor: Color.fromRGBO(255, 255, 255, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: BorderSide(
                          color: Color.fromRGBO(64, 158, 255, 1), width: 1)),
                  onPressed: () {
                    showLoadingDialog(context);
                  },
                ),
              ),
              new Center(
                child: new FlatButton(
                  child: Text('显示确认弹窗'),
                  color: Color.fromRGBO(64, 158, 255, 1),
                  textColor: Color.fromRGBO(255, 255, 255, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: BorderSide(
                          color: Color.fromRGBO(64, 158, 255, 1), width: 1)),
                  onPressed: () {
                    showConfirmDialog(context);
                  },
                ),
              ),
              new Center(
                child: new FlatButton(
                  child: Text('toast'),
                  color: Color.fromRGBO(64, 158, 255, 1),
                  textColor: Color.fromRGBO(255, 255, 255, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: BorderSide(
                          color: Color.fromRGBO(64, 158, 255, 1), width: 1)),
                  onPressed: () {
                    msgTips(context);
                  },
                ),
              )
            ],
          ),
        ));
  }

  void msgTips(BuildContext context) {
    Toast.toast(context, '显示弹窗toast');
  }

  void showAlterDialog(BuildContext context) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlterDialog(
            content: new Text('显示弹窗'),
          );
        });
  }

  void showLoadingDialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: '正在加载中......',
          );
        });
  }

  void showConfirmDialog(BuildContext context) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new ConfirmDiolog(
              title: '确认删除？',
              content: new Text('显示弹窗'),
              onConfirmEnvet: (val) {
                print(val);
              },
              onCloseEnvet: (val) {
                print(val);
              });
        });
  }
}
