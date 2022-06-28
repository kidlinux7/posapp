import 'package:pos/data/dataproviders/product_category_data_provider.dart';
import 'package:pos/data/models/product_category_model.dart';

class ProductCategoryRepository {
  final ProductCategoryDataProvider productCategoryDataProvider =
      ProductCategoryDataProvider();

  Future<List<ProductCategoryModel>> fetchProductCategory() async {
    return await productCategoryDataProvider.fetchProductCategory();
  }

  Future addProductCategory(String categoryName) async {
    return await productCategoryDataProvider.addProductCategory(categoryName);
  }

  Future deleteProductCategory(int categoryID) async {
    return await productCategoryDataProvider.deleteProductCategory(categoryID);
  }
}

class NetworkError extends Error {}
