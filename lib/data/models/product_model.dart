import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final int category;
  final String name;
  final String barcode;
  final String brand;
  final String specification;
  final String description;
  final bool stocked;
  final int minQuantity;
  final double wholesalePrice;
  final double retailPrice;
  final String image;

  const ProductModel(
      {required this.id,
      required this.category,
      required this.name,
      required this.barcode,
      required this.brand,
      required this.description,
      required this.image,
      required this.minQuantity,
      required this.retailPrice,
      required this.specification,
      required this.stocked,
      required this.wholesalePrice});

  factory ProductModel.fromJSON(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        category: json['category'],
        name: json['name'],
        barcode: json['barcode'],
        brand: json['brand'],
        specification: json['specification'],
        description: json['description'],
        stocked: json['stocked'],
        minQuantity: json['min_quantity'],
        wholesalePrice: json['wholesale_price'],
        retailPrice: json['retail_price'],
        image: json['image']);
  }

  List<Object?> get props => [
        id,
        category,
        name,
        barcode,
        brand,
        specification,
        description,
        stocked,
        minQuantity,
        wholesalePrice,
        retailPrice,
        image
      ];
}
