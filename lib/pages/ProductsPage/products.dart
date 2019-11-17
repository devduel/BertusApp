import 'package:flutter/material.dart';

import 'package:bertus_app/models/product.dart';
import 'package:bertus_app/pages/ProductPage/product.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;

  ProductsPage({this.products});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: buildAppBar(deviceSize),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              width: deviceSize.width * 0.95,
              height: deviceSize.height * 0.15,
              child: Card(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: deviceSize.width * 0.01,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    Container(
                        width: deviceSize.width * 0.2,
                        child: Hero(
                          tag: 'imageHero' + products[index].index,
                          child: Image.network(
                            products[index].imagesUrls[0],
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                    buildProductInfo(deviceSize, products[index]),
                  ],
                ),
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
      ),
    );
  }

  Widget buildAppBar(Size deviceSize) {
    return PreferredSize(
      preferredSize: Size.fromHeight(deviceSize.height * 0.06),
      child: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 5.0,
        title: Row(
          children: <Widget>[
            Text(
              'Nowości',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildProductInfo(Size deviceSize, Product product) {
  return Expanded(
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(product.title,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Open Sans',
                  fontSize: deviceSize.height * 0.025,
                )),
            Divider(
              color: Colors.grey[700],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_offer,
                      color: Colors.grey[700],
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.01,
                    ),
                    Text(
                      product.price.toStringAsFixed(2) + ' PLN',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Open Sans',
                        fontSize: deviceSize.height * 0.02,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.store,
                      color: Colors.grey[700],
                    ),
                    SizedBox(
                      width: deviceSize.width * 0.01,
                    ),
                    Text(
                      ((product.price + product.price * 0.23)
                              .toStringAsFixed(2)) +
                          ' PLN (z VAT)',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Open Sans',
                          fontSize: deviceSize.height * 0.02),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
