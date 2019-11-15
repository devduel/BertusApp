import 'package:bertus_app/data/productdata.dart';
import 'package:bertus_app/models/product.dart';
import 'package:flutter/material.dart';

class Bestsellers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = ProductData.bestsellers;
    var deviceSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: deviceSize.height * 0.02,
            left: deviceSize.width * 0.05,
          ),
          child: Text(
            'Najczęściej kupowane',
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
                fontFamily: 'Open Sans',
                fontSize: deviceSize.height * 0.03),
          ),
        ),
        Container(
          height: deviceSize.height * 0.25,
          child: buildBestsellersView(products, deviceSize),
        ),
      ],
    );
  }
}

Widget buildBestsellersView(List<Product> products, Size deviceSize) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: products.length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        child: Hero(
          tag: 'imageHero' + index.toString(),
          child: Material(
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: <Widget>[
                  Image.network(products[index].imagesUrls[0]),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: deviceSize.height * 0.005,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                    ),
                  )
                ],
              ),
            ),
            color: Colors.transparent,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/product');
        },
      );
    },
  );
}
