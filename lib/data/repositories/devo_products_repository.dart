import 'package:pos/domain/models/product.dart';
import 'package:pos/domain/repositories/products_repository.dart';

class DevoProductsRepository extends ProductsRepository {
  @override
  Future<List<Product>> getProducts() async {
    return [
      Product("Product 1", 10, "kg", 10.00),
      Product("Product 2", 10, "kg", 10.00),
      Product("Product 3", 10, "kg", 10.00),
    ];
  }
}
