import 'package:flutter/material.dart';
import 'package:flutterproject/api/api.dart';
// import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class VIPPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new VIPPageState();
}

class VIPPageState extends State<VIPPage> {
  final _pageTitle = 'VIP';
  int count = 1;
  var result = {};
  List<Widget> imageList = List();

  @override
  void initState() {
    // 整个App初始化
    getBanner();
    super.initState();
  }

  void getBanner() async {
    var data = await ApiInterface.getVipBanner().then((res) {
      return res.data;
    });
    var code = data['code'];
    if (code == 2000) {
      var dataList = data['data']['list'];

      dataList.forEach((item) {
        setState(() {
          imageList.add(Image.network(item['url'], fit: BoxFit.fill));
        });
      });
    }
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    int length = imageList.length;
    if (length > 0) {
      return (imageList[index]);
    } else {
      return new Image.network('http://127.0.0.1:8080/static/images/vip2.jpg',
          fit: BoxFit.fill);
    }
  }

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
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: new Swiper(
                  itemCount: 3,
                  itemBuilder: _swiperBuilder,
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.black54, activeColor: Colors.white)),
                  controller: SwiperController(),
                  scrollDirection: Axis.horizontal,
                  autoplay: true,
                  onTap: (index) => print('点击了第$index'),
                )),
            // RaisedButton(
            //   child: Text('获取banner'),
            //   onPressed: () {
            //     getBanner();
            //   },
            // )
          ],
        ));
  }
}
