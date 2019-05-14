import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';

class OrderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new OrderListState();
}

class OrderListState extends State<OrderListPage> {
  List list = new List();
  ScrollController _scrollController = new ScrollController();
  int _page = 1;
  bool isLoading = false;
  bool isPerformingRequest = false;

  @override
  void initState() {
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  getData() async {
    await ApiInterface.getUserList(_page).then((res) {
      var resultData = res.data;
      var userLists = resultData['data']['list'];
      userLists.forEach((item) {
        var userName = item['user_name'];
        var iphone = item['user_mobile'];
        var type = item['user_type'];
        var userAvatar = item['user_avatar'];
        var userStatus = item['user_status'];
        setState(() {
          list.add({
            'userName': userName,
            'iphone': iphone,
            'type': type,
            'userAvatar': userAvatar,
            'userStatus': userStatus
          });
          _page++;
          isLoading = true;
        });
      });
    });
  }

  Future<Null> _onRefresh() async {
    getData();
  }

  Future _getMore() async {
    if (!isLoading) {
      await Future.delayed(Duration(seconds: 1), () {
        getData();
      });
    }
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    int length = list.length;
    if (length > 0) {
      if (index < length) {
        return listItem(context, index);
      } else {
        // print('length=$length index==$index');
        return _getMoreWidget();
        // return null;
      }
    } else {
      return Text('暂无数据');
    }
  }

  Widget listItem(BuildContext context, int index) {
    var dataItems = list[index];
    var userName = dataItems['userName'] != null ? dataItems['userName'] : '';
    var iphone = dataItems['iphone'] != null ? dataItems['iphone'] : '';
    return new Container(
      margin: EdgeInsets.only(top: 10, right: 0, left: 0, bottom: 0),
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
        padding: EdgeInsets.only(top: 10, right: 0, left: 0, bottom: 10),
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            Text(userName),
            Text(iphone.toString()),
          ],
        ),
      ),
    );
  }

  Widget listView(BuildContext context) {
    return new Container(
        alignment: Alignment.center,
        // height: ma,
        padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
        child: new RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemBuilder: _renderRow,
            itemCount: list.length + 1,
            controller: _scrollController,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单列表'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              getData();
            },
            icon: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: new Container(
        child: listView(context),
      ),
    );
  }
}
