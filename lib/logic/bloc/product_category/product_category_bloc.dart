import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pos/data/models/product_category_model.dart';
import 'package:pos/data/repositories/product_category_repository.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

// Add and Fetch
class ProductCategoryBloc extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryRepository productCategoryRepository;

  ProductCategoryBloc({required this.productCategoryRepository})
      : super(ProductCategoryInitial()) {
    on<ProductCategoryEvent>((event, emit) {});

    on<AddProductCategoryPressed>(
      (event, emit) async {
        // final state = this.state;

        try {
          final addproductcategory = await productCategoryRepository
              .addProductCategory(event.categoryName);
          emit(AddProductCategoryLoading());
          emit(AddProductCategoryAdded());
        } catch (identifier) {
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
      } catch (identifier) {
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

// Delete
class ProductCategoryDeleteBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryRepository productCategoryRepository;

  ProductCategoryDeleteBloc({required this.productCategoryRepository})
      : super(ProductCategoryInitial()) {
    on<ProductCategoryEvent>((event, emit) {});

    on<DeleteProductCategoryPressed>(
      (event, emit) async {
        // final state = this.state;
        try {
          print('Do something');
          final deleteproductcategory = await productCategoryRepository
              .deleteProductCategory(event.categoryID);
          emit(DeleteProductCategoryLoading());
          emit(DeleteProductCategoryDeleted());
        } catch (identifier) {
          emit(DeleteProductCategoryError());
        }
      },
    );
  }
  void dispose() {}
  @override
  Future<void> close() {
    return super.close();
  }
}

// Edit
class ProductCategoryEditBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryRepository productCategoryRepository;

  ProductCategoryEditBloc({required this.productCategoryRepository})
      : super(ProductCategoryInitial()) {
    on<ProductCategoryEvent>((event, emit) {});

    on<EditProductCategoryPressed>(
      (event, emit) async {
        try {
          final editproductcategory =
              await productCategoryRepository.editProductCategory(
                  event.editcategoryID, event.editcategoryName);
          emit(EditProductCategoryLoading());
          emit(EditProductCategoryEdited());
        } catch (identifier) {
          emit(EditProductCategoryError());
        }
      },
    );
  }
  void dispose() {}
  @override
  Future<void> close() {
    return super.close();
  }
}
