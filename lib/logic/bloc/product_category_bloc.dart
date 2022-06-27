import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:pos/data/models/product_category_model.dart';
import 'package:pos/data/repositories/product_category_repository.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryRepository productCategoryRepository;

  ProductCategoryBloc({required this.productCategoryRepository})
      : super(ProductCategoryInitial()) {
    on<ProductCategoryEvent>((event, emit) {});

    on<AddProductCategoryPressed>(
      (event, emit) async {
        final state = this.state;
        
        try {
          final addproductcategory = await productCategoryRepository
              .addProductCategory(event.categoryName);
          emit(AddProductCategoryLoading());
          emit(AddProductCategoryAdded());
        } on NetworkError {
          emit(AddProductCategoryError());
        }
      },
    );

    on<FetchProductCategory>((event, emit) async {
      emit(ProductCategoryLoading());
      try {
        final List<ProductCategoryModel> productcategory =
            await productCategoryRepository.fetchProductCategory();
        emit(ProductCategoryLoaded(productcategory));
      } on NetworkError {
        emit(ProductCategoryError());
      }
    });
  }
  void dispose() {}
  @override
  Future<void> close() {
    return super.close();
  }
}
