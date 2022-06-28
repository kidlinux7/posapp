part of 'product_category_bloc.dart';

abstract class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchProductCategory extends ProductCategoryEvent {
  const FetchProductCategory();
}

class AddProductCategoryPressed extends ProductCategoryEvent {
  // {} used to define keyword arguments
  final String categoryName;
  const AddProductCategoryPressed({required this.categoryName});
}

class DeleteProductCategoryPressed extends ProductCategoryEvent {
  // {} used to define keyword arguments
  final int categoryID;
  const DeleteProductCategoryPressed({required this.categoryID});

}

