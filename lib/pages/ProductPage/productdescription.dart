import 'package:flutter/material.dart';

Widget buildProductDescription(Size deviceSize) {
  return Column(
    children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text('Opis',
            style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w500,
                fontFamily: 'Open Sans',
                fontSize: deviceSize.height * 0.03)),
      ),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        softWrap: true,
        style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w400,
            fontFamily: 'Open Sans',
            fontSize: deviceSize.height * 0.025),
      ),
    ],
  );
}
