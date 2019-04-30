import 'package:flutter/material.dart';

class AlterDialog extends Dialog {
  final String message;
  final Widget content;
  final Function onCloseEnvet;
  final Function onConfirmEnvet;

  const AlterDialog({
    Key key,
    this.message,
    this.content,
    this.onCloseEnvet,
    this.onConfirmEnvet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new SizedBox(
            child: new AlertDialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      contentPadding: EdgeInsets.all(10),
      content: content == null ? new Text(message) : content,
    )));
  }
}

class LoadingDialog extends Dialog {
  final String text;
  final double width;
  final double height;
  LoadingDialog({
    Key key,
    @required this.text,
    this.width = 150,
    this.height = 100,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return new GestureDetector(
        // 手势事件
        onTap: () {
          Navigator.pop(context);
        },
        child: new Material(
            //创建透明层
            type: MaterialType.transparency, //透明类型
            child: new Center(
              //保证控件居中效果
              child: new SizedBox(
                width: width,
                height: height,
                child: new Container(
                  decoration: ShapeDecoration(
                    color: Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3.0),
                      ),
                    ),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new CircularProgressIndicator(),
                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: new Text(
                          text,
                          style: new TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

class ConfirmDiolog extends Dialog {
  final String title;
  final Widget content;
  final Function onCloseEnvet;
  final Function onConfirmEnvet;

  const ConfirmDiolog({
    Key key,
    this.title,
    this.content,
    this.onCloseEnvet,
    this.onConfirmEnvet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: new AlertDialog(
        title: new Text(title),
        content: content,
        actions: <Widget>[
          new FlatButton(
            child: new Text("取消"),
            onPressed: () {
              var data = {'age': 12, 'name': '2323'};
              onCloseEnvet(data);
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("确定"),
            onPressed: () {
              onConfirmEnvet('confirm');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
