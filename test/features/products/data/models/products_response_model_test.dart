import 'dart:convert';

import "package:flutter_test/flutter_test.dart";
import 'package:products_app/layers/data/products/models/products_model.dart';

void main() {
  final ProductModel productModel = ProductModel(
    id: 2,
    title: 'product',
    price: 2.5,
    description: 'test test ',
    category: Category.ELECTRONICS,
    image: '',
    ratingCount: 3,
    ratingRate: 4.4,
  );

  group('fromJson', () {
    //TODO - implement test cases
  });
}
