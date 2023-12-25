import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/layers/domain/products/entities/product_entity.dart';

import '../../../../../core/injector.dart';
import '../../../../domain/products/usecases/get_products_usecase.dart';
import '../states/products_states.dart';

class ProductCubit extends Cubit<ProductsState> {
  final GetProdcutsUsecase _getProdcutsUsecase = getIt<GetProdcutsUsecase>();

  ProductCubit() : super(ProductsInitState());

  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    try {
      final List<ProductEntity> products = await _getProdcutsUsecase();
      emit(
        ProductsSuccessState(productsList: products),
      );
    } catch (e) {
      emit(ProductsErrorState(errorMessage: e.toString()));
      print(e);
    }
  }
}
