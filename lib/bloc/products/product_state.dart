import 'package:equatable/equatable.dart';
import 'package:pos/domain/models/product_model.dart';

enum ProductStatus { initial, success, failure }

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const <Product>[],
    this.hasReachedMax = false,
  });

  final ProductStatus status;
  final List<Product> products;
  final bool hasReachedMax;

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    bool? hasReachedMax,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, products, hasReachedMax];
}
