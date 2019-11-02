import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bestsellers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> products = [
      'https://eplecaki.pl/85596-thickbox_default/saszetka-piornik-vans-otw-pencil-pouch-black-czarny.jpg',
      'https://www.cultpens.com/imgs/products/cp/950_constW/CR64779~Cross-Classic-Century-Ballpoint-Pen-Brushed-Chrome_P1.jpg',
      'https://m.media-amazon.com/images/I/91PgpcLPc8L._SR500,500_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61qd5YbMRIL._SL1500_.jpg',
      'https://ecsmedia.pl/c/zeszyt-w-kratke-a4-mix-kolorow-w-iext43297071.jpg',
      'https://eplecaki.pl/85596-thickbox_default/saszetka-piornik-vans-otw-pencil-pouch-black-czarny.jpg'
    ];
    var deviceSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: deviceSize.width * 0.05),
          child: Text(
            'Najczęściej kupowane',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                fontSize: deviceSize.height * 0.035),
          ),
        ),
        Container(
          height: deviceSize.height * 0.2,
          child: bestSellersView(products),
        ),
      ],
    );
  }
}

Widget bestSellersView(List<String> products) {
  return Container(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(child: Image.network(products[index]));
      },
    ),
  );
}
