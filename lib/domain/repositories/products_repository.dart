import '../models/product_model.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
}
