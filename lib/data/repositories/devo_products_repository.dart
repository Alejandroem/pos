import 'package:pos/domain/models/product_model.dart';
import 'package:pos/domain/repositories/products_repository.dart';

class DevoProductsRepository extends ProductsRepository {
  @override
  Future<List<Product>> getProducts() async {
    return const [
      Product(name: "product1", amount: 10, unit: "kg", price: 10.00),
      Product(name: "product1", amount: 10, unit: "kg", price: 10.00),
      Product(name: "product1", amount: 10, unit: "kg", price: 10.00),
    ];
  }
}
