part of 'product_category_bloc.dart';

abstract class ProductCategoryState extends Equatable {
  const ProductCategoryState();

  @override
  List<Object> get props => [];
}

class ProductCategoryInitial extends ProductCategoryState {}

class ProductCategoryLoading extends ProductCategoryState {}

class ProductCategoryLoaded extends ProductCategoryState {
  final List<ProductCategoryModel> productcategory;
  const ProductCategoryLoaded(this.productcategory);
  @override
  List<Object> get props => [productcategory];
}

class ProductCategoryError extends ProductCategoryState {}

// Add
class AddProductCategoryDefault extends ProductCategoryState {}

class AddProductCategoryAdded extends ProductCategoryState {}

class AddProductCategoryLoading extends ProductCategoryState {}

class AddProductCategoryError extends ProductCategoryState {}

// Delete
class DeleteProductCategoryDefault extends ProductCategoryState {}

class DeleteProductCategoryDeleted extends ProductCategoryState {}

class DeleteProductCategoryLoading extends ProductCategoryState {}

class DeleteProductCategoryError extends ProductCategoryState {}

// Edit
class EditProductCategoryDefault extends ProductCategoryState {}

class EditProductCategoryEdited extends ProductCategoryState {}

class EditProductCategoryLoading extends ProductCategoryState {}

class EditProductCategoryError extends ProductCategoryState {}
