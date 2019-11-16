import 'package:flutter/material.dart';

Widget buildProductDescription(Size deviceSize, String productDescription) {
  return Column(
    children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Opis',
          style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w500,
            fontFamily: 'Open Sans',
            fontSize: deviceSize.height * 0.03,
          ),
        ),
      ),
      Text(
        productDescription,
        softWrap: true,
        style: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.w400,
          fontFamily: 'Open Sans',
          fontSize: deviceSize.height * 0.025,
        ),
      ),
    ],
  );
}
