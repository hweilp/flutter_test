import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new OrderListState();
}

class OrderListState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单列表'),
      ),
      body: new Container(
        child: new Text('订单列表'),
      ),
    );
  }
}
