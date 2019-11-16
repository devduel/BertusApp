import 'package:flutter/material.dart';

class Product {
  final String id;
  final String index;
  final String title;
  final String description;
  final String manufacturer;
  final double price;
  final String unit;
  final List<String> imagesUrls;

  Product({
    @required this.id,
    @required this.index,
    @required this.title,
    @required this.description,
    @required this.manufacturer,
    @required this.price,
    @required this.unit,
    @required this.imagesUrls,
  });
}
