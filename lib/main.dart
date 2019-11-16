import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:bertus_app/models/products.dart';
import 'package:bertus_app/pages/HomePage/home.dart';
import 'package:bertus_app/pages/ProductsPage/products.dart';
import 'package:bertus_app/pages/ProductPage/product.dart';

void main() => runApp(
      ChangeNotifierProvider(
        builder: (context) => ProductsModel(),
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BertusApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromRGBO(0, 80, 155, 1.0),
        accentColor: Color.fromRGBO(0, 80, 155, 0.9),
      ),
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/product': (BuildContext context) => ProductPage(),
        '/products': (BuildContext context) => ProductsPage()
      },
    );
  }
}
