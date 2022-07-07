import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pos/data/api/api_url.dart';
import 'package:pos/data/models/product_category_model.dart';
import 'package:pos/presentation/widgets/snackbar.dart';

class ProductCategoryDataProvider {
  final _baseUrl = InventoryLink.inventorylink;
  final successCode = 200;
  final Headers = {
    'Content-Type': 'application/json',
  };

  Future<List<ProductCategoryModel>> fetchProductCategory() async {
    var url = Uri.parse('${_baseUrl}get/product/categories');
    var response = await http.get(url);
    List<ProductCategoryModel> product_category = [];

    if (response.statusCode == successCode) {
      var json = jsonDecode(response.body);

      for (var resp in json) {
        var productcategory =
            ProductCategoryModel(id: resp['id'], name: resp['name']);
        product_category.add(productcategory);
      }
      return product_category;
    } else {
      throw response.statusCode;
    }
  }

  Future addProductCategory(String categoryName) async {
    var url = Uri.parse('${_baseUrl}add/product/category');
    var response = await http.post(url,
        headers: Headers,
        body: jsonEncode(<String, String>{'name': categoryName}));
    if (response.statusCode == successCode) {
      // const SnackBar(
      //   content: Text('Category not added'),
      // );
      // print('success');
    } else {
      throw response.statusCode;
    }
  }

  Future deleteProductCategory(int categoryID) async {
    var url = Uri.parse('${_baseUrl}delete/product/category');
    var response = await http.post(url,
        headers: Headers, body: jsonEncode({'id': categoryID}));
    if (response.statusCode == successCode) {
      // const SnackBar(
      //   content: Text('Category not added'),
      // );
      print('success');
    } else {
      print('crazy O_o');

      throw response.statusCode;
    }
  }

  Future editProductCategory(
      int editcategoryID, String editcategoryName) async {
    var url = Uri.parse('${_baseUrl}edit/product/category');
    var response = await http.post(url,
        headers: Headers,
        body: jsonEncode({'id': editcategoryID, 'name': editcategoryName}));
    if (response.statusCode == successCode) {
      // const SnackBar(
      //   content: Text('Category not added'),
      // );
      print('success');
    } else {
      print('crazy O_o');

      throw response.statusCode;
    }
  }
}
