import 'package:products_app/layers/domain/products/entities/product_entity.dart';
import 'package:products_app/layers/domain/products/repositories/product_repository.dart';

class GetProdcutsUsecase {
  ProductRepository _productRepository;

  GetProdcutsUsecase(this._productRepository);

  Future<List<ProductEntity>> call() async =>
      await _productRepository.getProducts();
}
