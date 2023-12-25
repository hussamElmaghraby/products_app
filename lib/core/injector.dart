import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:products_app/layers/data/products/datasources/products_datasource.dart';
import 'package:products_app/layers/domain/products/repositories/product_repository.dart';
import 'package:products_app/layers/domain/products/usecases/get_products_usecase.dart';

import '../layers/data/products/datasources/products_datasource_offline.dart';
import '../layers/data/products/datasources/products_datasource_online.dart';
import '../layers/data/products/repo_impl/product_repo_impl.dart';
import '../utils/connection_status_singleton.dart';

GetIt getIt = GetIt.instance;

void configureInjector() {
  getProducts();
}

//features
void getProducts() {
  //datasources
  getIt.registerFactory<ProductsDatasource>(() => ProductsDatasourceOnline(),
      instanceName: "productsDatasourceOnline");
  getIt.registerFactory<ProductsDatasource>(() => ProductsDatasourceOffline(),
      instanceName: "productsDatasourceOffline");

  //repos
  getIt.registerLazySingleton<ConnectionStatusSingleton>(
    () => ConnectionStatusSingleton.getInstance(),
  );

  getIt.registerFactory<ProductRepository>(
    () => ProductRepoImpl(
      getIt<ProductsDatasource>(instanceName: "productsDatasourceOnline"),
      getIt<ProductsDatasource>(instanceName: "productsDatasourceOffline"),
      getIt<ConnectionStatusSingleton>(),
    ),
  );

  //usecases
  getIt.registerFactory<GetProdcutsUsecase>(
    () => GetProdcutsUsecase(
      getIt<ProductRepository>(),
    ),
  );
}
