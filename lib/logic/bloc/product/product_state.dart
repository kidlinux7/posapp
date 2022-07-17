part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> productlist;
  const ProductLoaded(this.productlist);
  @override
  List<Object> get props => [productlist];
}

class ProductError extends ProductState {}
