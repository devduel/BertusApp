import 'package:flutter/material.dart';

Widget buildAnnouncement(String announcement, Size deviceSize) {
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
              fontWeight: FontWeight.w500,
              fontFamily: 'Open Sans',
              fontSize: deviceSize.height * 0.025),
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
