import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:bertus_app/models/products.dart';
import 'package:bertus_app/models/product.dart';
import 'package:bertus_app/pages/ProductPage/product.dart';

class Bestsellers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Consumer<ProductsModel>(
      builder: (context, products, child) {
        List<Product> bestsellers = products.bestsellers;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Najczęściej kupowane',
              style: TextStyle(
                color: Colors.grey[1000],
                fontWeight: FontWeight.w500,
                fontFamily: 'Open Sans',
                fontSize: deviceSize.height * 0.035,
              ),
            ),
            Container(
              height: deviceSize.height * 0.25,
              child: buildBestsellersView(
                bestsellers.reversed.toList(),
                deviceSize,
              ),
            ),
          ],
        );
      },
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
          tag: 'imageHero' + products[index].index.toString(),
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
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            color: Colors.transparent,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                product: products[index],
              ),
            ),
          );
        },
      );
    },
  );
}
