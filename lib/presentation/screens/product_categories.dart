import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/data/models/product_category_model.dart';
import 'package:pos/data/repositories/product_category_repository.dart';
import 'package:pos/logic/bloc/product_category_bloc.dart';
import 'package:pos/presentation/screens/add_category.dart';
import 'package:pos/presentation/widgets/card.dart';
import 'package:pos/presentation/widgets/circular_loader.dart';
import 'package:pos/presentation/widgets/text.dart';

class ProductCategories extends StatefulWidget {
  const ProductCategories({Key? key}) : super(key: key);

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  late final ProductCategoryBloc productCategoryBloc;
  final ProductCategoryRepository productCategoryRepository = ProductCategoryRepository();

  @override
  void initState() {
    productCategoryBloc = ProductCategoryBloc(
        productCategoryRepository: productCategoryRepository);
    productCategoryBloc.add(const FetchProductCategory());
    super.initState();
  }

  @override
  void dispose() {
    productCategoryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.blue, size: 30.0),
            elevation: 0.0,
            title: const HeadingText(word: 'Categories')),
        body: BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
          bloc: productCategoryBloc,
          builder: (context, state) {
            if (state is ProductCategoryLoading) {
              return const CircularLoader();
            } else if (state is ProductCategoryLoaded) {
              List<ProductCategoryModel> Productcategory =
                  state.productcategory;
              return ListView.builder(
                  itemCount: Productcategory.length,
                  itemBuilder: (BuildContext context, index) {
                    return CategoryCard(
                        categoryName: Productcategory[index].name);
                  });
            }
            return SizedBox(
              height: deviceHeight,
              width: deviceWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.category,
                    size: 50,
                  ),
                  NormalText(word: 'Add a category')
                ],
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
            // isExtended: true,
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddCategory()),
              );
            },
            // isExtended: true,
            child: const Icon(Icons.add)));
  }
}
