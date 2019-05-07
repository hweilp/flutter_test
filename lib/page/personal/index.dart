import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          child: Swiper(
            itemBuilder: _swiperBuilder,
            itemCount: 3,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
            // control: new SwiperControl(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            autoplayDelay: 5000,
            onTap: (index) {
              print(index);
            },
          )),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      'http://pic1.win4000.com/wallpaper/9/5450ae2fdef8a.jpg',
      fit: BoxFit.fill,
    ));
  }
}
