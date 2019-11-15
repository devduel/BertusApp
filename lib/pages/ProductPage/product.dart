import 'package:flutter/material.dart';

import 'package:bertus_app/pages/ProductPage/productdescription.dart';
import 'package:bertus_app/pages/ProductPage/productinfo.dart';

import 'package:carousel_slider/carousel_slider.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  static List<String> imgList = [
    'https://ecsmedia.pl/c/zeszyt-w-kratke-a4-mix-kolorow-w-iext43297071.jpg',
    'https://www.cultpens.com/imgs/products/cp/950_constW/CR64779~Cross-Classic-Century-Ballpoint-Pen-Brushed-Chrome_P1.jpg',
    'https://m.media-amazon.com/images/I/91PgpcLPc8L._SR500,500_.jpg',
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: deviceSize.height * 0.4,
                  child: CarouselSlider(
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    items: carouselItems,
                  ),
                ),
                buildDottedIndicator(deviceSize),
                Positioned(
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    leading: BackButton(
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
              Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      buildProductInfo(deviceSize),
                      SizedBox(
                        height: deviceSize.height * 0.02,
                      ),
                      buildProductDescription(deviceSize),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List carouselItems = map<Widget>(
    imgList,
    (index, i) {
      return Container(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Center(child: Image.network(i, fit: BoxFit.fitHeight)),
            ],
          ),
        ),
      );
    },
  ).toList();

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget buildDottedIndicator(Size deviceSize) {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
          (index, url) {
            return Container(
              width: deviceSize.width * 0.02,
              height: deviceSize.height * 0.02,
              margin: EdgeInsets.symmetric(
                  vertical: deviceSize.height * 0.015,
                  horizontal: deviceSize.width * 0.01),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    );
  }
}
