import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget createAnnouncement(String announcement) {
  return Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          Icons.error,
          color: Colors.white,
        ),
        Text(
          announcement,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              // fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans',
              fontSize: 12),
        ),
        Icon(
          Icons.error,
          color: Colors.white,
        ),
      ],
    ),
    color: Colors.orange,
  );
}
