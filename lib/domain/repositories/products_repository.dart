import '../models/product_model.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts({int limit = 40, int offset = 0});
}
