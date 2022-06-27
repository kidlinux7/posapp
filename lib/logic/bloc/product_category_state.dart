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
class ProductCategoryError extends ProductCategoryState{}


class AddProductCategoryDefault extends ProductCategoryState {}

class AddProductCategoryAdded extends ProductCategoryState {}

class AddProductCategoryLoading extends ProductCategoryState {}

class AddProductCategoryError extends ProductCategoryState {}


