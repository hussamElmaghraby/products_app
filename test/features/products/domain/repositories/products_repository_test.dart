import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:products_app/layers/data/products/datasources/products_datasource.dart';
import 'package:products_app/layers/data/products/models/products_model.dart';
import 'package:products_app/layers/data/products/repo_impl/product_repo_impl.dart';
import 'package:products_app/layers/domain/products/entities/product_entity.dart';
import 'package:products_app/utils/connection_status_singleton.dart';

class MockProductDatasourceOffline extends Mock implements ProductsDatasource {}

class MockProductDatasourceOnline extends Mock implements ProductsDatasource {}

void main() {
  ProductRepoImpl? repository;
  ProductsDatasource? mockProductDatasourceOffline =
      MockProductDatasourceOffline();
  ProductsDatasource? mockProductDatasourceOnline =
      MockProductDatasourceOnline();

  setUp(() {
    mockProductDatasourceOffline = MockProductDatasourceOffline();
    mockProductDatasourceOnline = MockProductDatasourceOnline();
    repository = ProductRepoImpl(mockProductDatasourceOnline!,
        mockProductDatasourceOffline!, ConnectionStatusSingleton.getInstance());
  });

  void runGetProductsOnline(Function body) {
    group('get products', () {
      setUp(() async {
        print(repository);
        final test = await repository?.getProducts();
        when(repository?.getProducts()).thenAnswer((_) async => <ProductEntity>[
              ProductEntity(),
            ]);
      });
      body();
    });
  }

  void runGetProductsOffline(Function body) {
    group('get products', () {
      setUp(() async {
        final test = await repository?.getProducts();
        when(repository?.getProducts()).thenAnswer((_) async => <ProductEntity>[
              ProductEntity(),
            ]);
      });
      body();
    });
  }

  runGetProductsOffline(() {
    final productsResponseModel = [
      ProductModel(
        id: 2,
        title: 'product',
        description: 'test test ',
        price: 2.5,
        category: Category.ELECTRONICS,
        image: '',
        ratingCount: 2,
        ratingRate: 2.4,
      )
    ];
    test(
      'get products offline',
      () async {
        //arrange
        when(mockProductDatasourceOffline?.getProducts())
            .thenAnswer((_) async => productsResponseModel);
        //acts
        final result = await repository?.getProducts();

        // assert
        verify(mockProductDatasourceOffline?.getProducts());
        expect(result?[0].id, equals(productsResponseModel[0].id));
      },
    );
  });

  runGetProductsOnline(() {
    final productsResponseModel = [
      ProductModel(
        id: 2,
        title: 'product',
        description: 'test test ',
        price: 2.5,
        category: Category.ELECTRONICS,
        image: '',
        ratingCount: 2,
        ratingRate: 2.4,
      )
    ];
    test(
      'get products online',
      () async {
//arrange
        when(mockProductDatasourceOnline?.getProducts())
            .thenAnswer((_) async => productsResponseModel);
//acts
        final result = await repository?.getProducts();

// assert
        verify(mockProductDatasourceOnline?.getProducts());
        expect(result?[0].id, equals(productsResponseModel[0].id));
      },
    );
  });
}
