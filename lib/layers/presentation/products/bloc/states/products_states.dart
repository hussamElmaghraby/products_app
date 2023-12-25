import '../../../../domain/products/entities/product_entity.dart';

abstract class ProductsState {}

class ProductsErrorState extends ProductsState {
  final String errorMessage;

  ProductsErrorState({required this.errorMessage});
}

class ProductsSuccessState extends ProductsState {
  final List<ProductEntity> productsList;

  ProductsSuccessState({required this.productsList});
}

class ProductsLoadingState extends ProductsState {}

class ProductsInitState extends ProductsState {}
