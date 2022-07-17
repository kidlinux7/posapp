import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos/data/api/api_url.dart';
import 'package:pos/data/models/product_model.dart';

class ProductDataProvider {
  final _baseUrl = InventoryLink.inventorylink;
  final successCode = 200;
  final Headers = {
    'Content-Type': 'application/json',
  };

  Future<List<ProductModel>> fetchProduct() async {
    var url = Uri.parse('${_baseUrl}get/products');
    var response = await http.get(url);
    List<ProductModel> product_list = [];

    if (response.statusCode == successCode) {
      var json = jsonDecode(response.body);
      // print(json);
      for (var resp in json) {
        var productlist = ProductModel(
            id: resp['id'],
            category: resp['category'],
            name: resp['name'],
            barcode: resp['barcode'],
            brand: resp['brand'],
            specification: resp['specification'],
            description: resp['description'],
            stocked: resp['stocked'],
            minQuantity: resp['min_quantity'],
            wholesalePrice: double.parse("${resp['wholesale_price']}"),
            retailPrice: double.parse("${resp['retail_price']}"),
            // wholesalePrice: double.parse("${resp['wholesalePrice']}"),
            // retailPrice: double.parse("${resp['retailPrice']}"),
            image: resp['image']);

        product_list.add(productlist);
      }
      return product_list;
    } else {
      throw response.statusCode;
    }
  }
}
