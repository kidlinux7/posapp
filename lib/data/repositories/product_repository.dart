import 'package:pos/data/dataproviders/product_data_provider.dart';
import 'package:pos/data/models/product_model.dart';

class ProductRepository {
  final ProductDataProvider productDataProvider = ProductDataProvider();

  Future<List<ProductModel>> fetchProduct() async {
    return await productDataProvider.fetchProduct();
  }
}

class NetworkError extends Error {}
