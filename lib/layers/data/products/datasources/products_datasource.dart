import 'package:products_app/layers/data/products/models/products_model.dart';


abstract class ProductsDatasource {
  Future<List<ProductModel>> getProducts();
}