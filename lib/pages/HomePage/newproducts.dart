import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bertus_app/models/products.dart';
import 'package:bertus_app/models/product.dart';
import 'package:bertus_app/pages/ProductPage/product.dart';
import 'package:bertus_app/pages/ProductsPage/products.dart';

class NewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Consumer<ProductsModel>(builder: (context, products, child) {
      List<Product> newProducts = products.newProducts;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: deviceSize.width * 0.05,
            ),
            child: Text(
              'Nowości',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Open Sans',
                  fontSize: deviceSize.height * 0.03),
            ),
          ),
          buildNewProductsView(context, newProducts),
        ],
      );
    });
  }

  Widget buildNewProductsView(BuildContext context, List<Product> newProducts) {
    var deviceSize = MediaQuery.of(context).size;

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.count(
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
          newProducts.length,
          (index) {
            if (index == newProducts.length - 1) {
              return GestureDetector(
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/more_products.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  color: Colors.black.withOpacity(0.7),
                                  child: Center(
                                    child: Text(
                                      'Zobacz więcej',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Open Sans',
                                          fontSize: deviceSize.height * 0.03),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: deviceSize.height * 0.005,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsPage(
                                products: newProducts,
                              )));
                },
              );
            }
            return GestureDetector(
              child: Material(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: Hero(
                              tag: 'imageHero' + newProducts[index].index,
                              child: Image.network(
                                  newProducts[index].imagesUrls[0]))),
                      Container(
                        height: deviceSize.height * 0.005,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                      ),
                    ],
                  ),
                ),
                color: Colors.transparent,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(
                              product: newProducts[index],
                            )));
              },
            );
          },
        ),
      ),
    );
  }
}
