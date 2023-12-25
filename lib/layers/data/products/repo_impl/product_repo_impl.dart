import 'package:products_app/layers/data/products/datasources/products_datasource.dart';
import 'package:products_app/layers/domain/products/entities/product_entity.dart';

import '../../../../utils/connection_status_singleton.dart';
import '../../../domain/products/repositories/product_repository.dart';
import '../models/products_model.dart';

class ProductRepoImpl extends ProductRepository {
  final ProductsDatasource _productsDatasourceOnline;
  final ProductsDatasource _productsDatasourceOffline;
  final ConnectionStatusSingleton _connectionStatusSingleton;

  ProductRepoImpl(
      this._productsDatasourceOnline, this._productsDatasourceOffline , this._connectionStatusSingleton,);

  ProductsDatasource getProductDatasource() =>
      _connectionStatusSingleton.hasConnection
          ? _productsDatasourceOnline
          : _productsDatasourceOffline;

  @override
  Future<List<ProductEntity>> getProducts() async {
    final List<ProductModel> productsModelList =
        await getProductDatasource().getProducts();

    // data preparing
    final List<ProductEntity> productEntityList = productsModelList
        .map((model) => ProductEntity(
              rating: model.ratingRate.toString(),
              ratingCount: model.ratingCount.toString(),
              title: model.title,
              description: model.description,
              image: model.image,
              price: model.price,
              category: model.category.name,
            ))
        .toList();
    return productEntityList;
  }
}
