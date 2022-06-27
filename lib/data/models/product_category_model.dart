import 'package:equatable/equatable.dart';

class ProductCategoryModel extends Equatable {
  final int id;
  final String name;

  const ProductCategoryModel({required this.id, required this.name});

  factory ProductCategoryModel.fromJSON(Map<String, dynamic> json) {
    return ProductCategoryModel(id: json['id'], name: json['name']);
  }

  List<Object?> get props => [id, name];
}
