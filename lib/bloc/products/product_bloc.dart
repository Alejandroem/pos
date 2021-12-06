import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_state.dart';
import 'product_event.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepository productRepository;

  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<ProductsFetched>(_onProductsFetched);
  }

  Future<void> _onProductsFetched(
      ProductsFetched event, Emitter<ProductState> emit) async {
    if (state.hasReachedMax) return;

    try {
      List<Product> products = await productRepository.getProducts();
      if (state.status == ProductStatus.initial) {
        return emit(state.copyWith(
          status: ProductStatus.success,
          products: products,
          hasReachedMax: false,
        ));
      }

      products = await productRepository.getProducts(
          limit: 10, offset: state.products.length);
      products.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: ProductStatus.success,
                products: List.of(state.products)..addAll(products),
                hasReachedMax: false,
              ),
            );
    } catch (e) {
      return emit(state.copyWith(status: ProductStatus.failure));
    }
  }
}
