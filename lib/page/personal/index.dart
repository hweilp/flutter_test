import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var str = '2323';
    return new Scaffold(
        appBar: AppBar(
          title: Text('我'),
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
            Text('我'),
            IconButton(
              icon: Icon(Icons.accessible_forward),
              onPressed: () {
                print(' 正在打印 list 1');
                print(str);
              },
            )
          ],
        ));
  }
}
