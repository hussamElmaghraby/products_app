import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:products_app/layers/data/products/datasources/products_datasource.dart';
import 'package:products_app/layers/data/products/models/products_model.dart';

import '../../../base/base_urls.dart';

class ProductsDatasourceOnline implements ProductsDatasource {
  final dio = Dio();

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get("$apiUrl$productsEndpoint");
    final jsonData = jsonEncode(response.data);
    final List<ProductModel> products = productFromJson(jsonData);
    return products;
  }
}
