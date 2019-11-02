import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bestsellers.dart';

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
      body: Bestsellers(),
    );
  }
}
