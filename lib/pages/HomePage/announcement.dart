import 'package:flutter/material.dart';

Widget buildAnnouncement(String announcement) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Card(
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
    ),
  );
}
