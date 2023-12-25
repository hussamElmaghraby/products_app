import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_app/core/injector.dart';
import 'package:products_app/layers/data/products/datasources/products_datasource.dart';

void main() {
  ProductsDatasource dataSource;
  setUp(() {
    dataSource = getIt<ProductsDatasource>();
  });
  group('getProducts', () {
    //TODO - implement test cases
  });
}
