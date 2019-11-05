import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bestsellers.dart';
import 'newproducts.dart';
import 'announcement.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: buildAppBar(deviceSize),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            createAnnouncement(
                'W dniu 1 sierpnia Hurtownia nieczynna. Przepraszamy.'),
            Bestsellers(),
            NewProducts(),
          ],
        ),
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
              'BertusApp',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
