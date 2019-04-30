import 'package:flutter/material.dart';

class VIPPage extends StatelessWidget {
  final _pageTitle = 'VIP';
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
                // Navigator.pushNamed(context, 'home_page');
              },
            )
          ],
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Text(_pageTitle),
            IconButton(
              icon: Icon(Icons.accessible_forward),
              onPressed: () {
                print(' 正在打印 list 1');
              },
            )
          ],
        ));
  }
}
