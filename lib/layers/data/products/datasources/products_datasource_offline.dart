import 'dart:convert';

import 'package:products_app/layers/data/products/datasources/products_datasource.dart';
import 'package:products_app/layers/data/products/models/products_model.dart';

import '../../../../utils/db_singleton.dart';

class ProductsDatasourceOffline implements ProductsDatasource {
  @override
  Future<List<ProductModel>> getProducts() async {
    // temporarily prepare data here.
    await DatabaseHelper.instance.database;
    await prepareDummydata();
    await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> rawProducts = await DatabaseHelper.instance.queryAllRows();
    final products = rawProducts
        .map(
          (e) => ProductModel.fromJson(e),
        )
        .toList();
    return products;
  }
}

Future<void> prepareDummydata() async {
  DatabaseHelper.instance.insert({
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description":
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "ratingrate": 3.9,
    "ratingcount": 120,
  });
}
