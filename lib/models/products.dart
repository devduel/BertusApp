import 'package:flutter/material.dart';

import 'package:bertus_app/data/productdata.dart';
import 'package:bertus_app/models/product.dart';

class ProductsModel extends ChangeNotifier {
  List<Product> get bestsellers => ProductData.bestsellers;
  List<Product> get newProducts => ProductData.newProducts;
}
