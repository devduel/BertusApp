import 'package:flutter/material.dart';

import 'announcement.dart';
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
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: buildAppBar(deviceSize),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildAnnouncement(
                  'Nieczynne 1 sierpnia. Przepraszamy.', deviceSize),
              Divider(),
              Bestsellers(),
              Divider(),
              NewProducts(),
            ],
          ),
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
