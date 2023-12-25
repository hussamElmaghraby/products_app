import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/layers/domain/products/entities/product_entity.dart';
import 'package:products_app/layers/presentation/products/bloc/cubits/products_cubit.dart';
import 'package:products_app/layers/presentation/products/bloc/states/products_states.dart';

import '../../../../utils/common_sizes.dart';
import '../widgets/error_popp.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  // List<ProductEntity>? products = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit()..getProducts(),
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<ProductCubit, ProductsState>(listener: (ctx, state) {
            if (state is ProductsErrorState) {
              showErrorDialog(context: ctx, errorMessage: state.errorMessage);
            }
          }, builder: (_, state) {
            if (state is ProductsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsSuccessState) {
              state.productsList;

              return Container(
                padding: const EdgeInsets.all(CommonSizes.size20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Products',
                      style: TextStyle(
                        fontSize: CommonSizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: CommonSizes.size25,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.separated(
                        itemCount: state.productsList?.length ?? 0,
                        itemBuilder: (ctx, idx) {
                          final ProductEntity? product = state.productsList?[idx];
                          return ProductItemWidget(
                            image: product?.image ?? '',
                            title: product?.title,
                            category: product?.category,
                            rating: product?.rating,
                            description: product?.description,
                            price: product?.price,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 30,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }else {
              return const Center(child: Text('There is no data'),);
            }
          }),
        ),
      ),
    );
  }
}
