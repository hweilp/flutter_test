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
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          height: 200.0,
          child: new Column(
            children: <Widget>[_mineTop(context)],
          )),
    );
  }

  Widget _mineTop(BuildContext context) {
    return new Container(
      height: 130,
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
