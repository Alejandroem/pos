import 'package:dio/dio.dart';
import 'package:pos/domain/models/product_model.dart';
import 'package:pos/domain/repositories/products_repository.dart';

class DevoProductsRepository extends ProductsRepository {
  @override
  Future<List<Product>> getProducts({int limit = 40, int offset = 0}) async {
    List<Product> products = [];
    var dio = Dio();

    final response = await dio.get(
      "https://ss.stable.devo.co.uk/shopProduct/elastic?shopUuid=922d04c5-a340-438a-977d-f7b69cc1dace",
      queryParameters: {
        'offset': offset,
        'limit': limit,
      },
    );
    response.data['shopProducts'].forEach((product) {
      products.add(Product(
        name: product['product']['name'],
        quantityUnits: product['product']['quantityUnits'],
        quantityMeasure: product['product']['quantityMeasure'],
        price: product['devoPrice'],
        thumbnail: product['product']['thumbnail'],
      ));
    });

    return products;
  }
}
