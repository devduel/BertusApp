import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bestsellers.dart';
import 'newproducts.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Bestsellers(),
          Divider(),
          NewProducts(),
        ],
      ),
    );
  }
}
