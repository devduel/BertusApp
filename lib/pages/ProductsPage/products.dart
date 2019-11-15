import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> products = [
      'https://static4.redcart.pl/templates/images/thumb/2732/1500/1500/pl/0/templates/images/products/2732/1eb63c25eac502b400a51370fceef292.jpg',
      'https://plecak-tornister.pl/16263-large_default/plecak-simple-roses-z-roza-black-czarny.jpg',
      'https://ecsmedia.pl/c/bee-bee-piornik-typu-kostka-flamingi-w-iext53073819.jpg',
      'https://eplecaki.pl/85596-thickbox_default/saszetka-piornik-vans-otw-pencil-pouch-black-czarny.jpg',
      'https://alledrogeria.pl/7714-large_default/saffron-neonowa-kredka-do-oczu-i-ust-neon-pencil.jpg',
      'https://www.cultpens.com/imgs/products/cp/950_constW/CR64779~Cross-Classic-Century-Ballpoint-Pen-Brushed-Chrome_P1.jpg',
      'https://static4.redcart.pl/templates/images/thumb/2732/1500/1500/pl/0/templates/images/products/2732/1eb63c25eac502b400a51370fceef292.jpg',
      'https://plecak-tornister.pl/16263-large_default/plecak-simple-roses-z-roza-black-czarny.jpg',
      'https://ecsmedia.pl/c/bee-bee-piornik-typu-kostka-flamingi-w-iext53073819.jpg',
      'https://eplecaki.pl/85596-thickbox_default/saszetka-piornik-vans-otw-pencil-pouch-black-czarny.jpg',
      'https://alledrogeria.pl/7714-large_default/saffron-neonowa-kredka-do-oczu-i-ust-neon-pencil.jpg',
      'https://www.cultpens.com/imgs/products/cp/950_constW/CR64779~Cross-Classic-Century-Ballpoint-Pen-Brushed-Chrome_P1.jpg'
    ];
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                    ),
                    Container(
                        width: deviceSize.width * 0.2,
                        child: Image.network(
                          products[index],
                          fit: BoxFit.fitHeight,
                        )),
                    buildProductInfo(deviceSize),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/product');
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

Widget buildProductInfo(Size deviceSize) {
  return Expanded(
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Piórnik dwukomorowy z wyposażeniem',
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
                      '3.49' + ' PLN',
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
                      '3.87' + ' PLN (z VAT)',
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
