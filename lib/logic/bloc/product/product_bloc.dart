import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pos/data/models/product_model.dart';
import 'package:pos/data/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});

    on<FetchProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final List<ProductModel> productlist =
            await productRepository.fetchProduct();
        emit(ProductLoaded(productlist));
      } catch (identifier) {
        emit(ProductError());
      }
    });
  }
  void dispose() {}
  @override
  Future<void> close() {
    return super.close();
  }
}
