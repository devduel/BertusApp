import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:bertus_app/models/product.dart';
import 'package:bertus_app/pages/ProductPage/productdescription.dart';
import 'package:bertus_app/pages/ProductPage/productinfo.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  ProductPage({this.product});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    Size deviceSize = MediaQuery.of(context).size;
    List carouselItems = map<Widget>(
      product.imagesUrls,
      (index, i) {
        return Container(
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: 'imageHero' + product.index.toString(),
                    child: Image.network(i, fit: BoxFit.fitHeight),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceSize.height * 0.06),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 5.0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: deviceSize.height * 0.4,
                    child: CarouselSlider(
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      onPageChanged: (index) {
                        setState(
                          () {
                            _current = index;
                          },
                        );
                      },
                      items: carouselItems,
                    ),
                  ),
                  buildDottedIndicator(deviceSize, product.imagesUrls),
                ],
              ),
              Container(
                color: Colors.grey[50],
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      buildProductInfo(deviceSize, product),
                      Divider(),
                      buildProductDescription(deviceSize, product.description),
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

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget buildDottedIndicator(Size deviceSize, List<String> productImagesUrls) {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          productImagesUrls,
          (index, url) {
            return Container(
              width: deviceSize.width * 0.02,
              height: deviceSize.height * 0.02,
              margin: EdgeInsets.symmetric(
                vertical: deviceSize.height * 0.015,
                horizontal: deviceSize.width * 0.01,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          },
        ),
      ),
    );
  }
}
