import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> products = [
      'https://static4.redcart.pl/templates/images/thumb/2732/1500/1500/pl/0/templates/images/products/2732/1eb63c25eac502b400a51370fceef292.jpg',
      'https://plecak-tornister.pl/16263-large_default/plecak-simple-roses-z-roza-black-czarny.jpg',
      'https://ecsmedia.pl/c/bee-bee-piornik-typu-kostka-flamingi-w-iext53073819.jpg',
      'https://eplecaki.pl/85596-thickbox_default/saszetka-piornik-vans-otw-pencil-pouch-black-czarny.jpg',
      'https://alledrogeria.pl/7714-large_default/saffron-neonowa-kredka-do-oczu-i-ust-neon-pencil.jpg',
      'https://www.cultpens.com/imgs/products/cp/950_constW/CR64779~Cross-Classic-Century-Ballpoint-Pen-Brushed-Chrome_P1.jpg'
    ];
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
            'Nowości',
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontFamily: 'Open Sans',
                fontSize: deviceSize.height * 0.03),
          ),
        ),
        Container(
          height: deviceSize.height * 0.5,
          child: buildNewProductsView(context, products),
        ),
      ],
    );
  }
}

Widget buildNewProductsView(BuildContext context, List<String> products) {
  var deviceSize = MediaQuery.of(context).size;

  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        products.length,
        (index) {
          if (index == products.length - 1) {
            return Card(
              child: Text('Placeholder for More Products button'),
            );
          }
          return Card(
            child: Column(
              children: <Widget>[
                Expanded(child: Image.network(products[index])),
                Container(
                  height: deviceSize.height * 0.005,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
