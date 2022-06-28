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
  final ProductCategoryRepository productCategoryRepository =
      ProductCategoryRepository();

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

  late String capturedProductCategoryName = '';
  late int capturedProductCategoryID = 0;

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
            // if (state is ProductCategoryLoading) {
            //   return const CircularLoader();
            // }
            // if (state is DeleteProductCategoryDeleted) {
            //   // print('Deleted');
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Product Category Deleted')));
            // }
            if (state is ProductCategoryLoaded) {
              List<ProductCategoryModel> Productcategory =
                  state.productcategory;
              return ListView.builder(
                  itemCount: Productcategory.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60.0,
                        width: deviceWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromARGB(228, 255, 255, 255),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child:
                                  NormalText(word: Productcategory[index].name),
                            ),
                            IconButton(
                                onPressed: () {
                                  // setState(() {
                                  capturedProductCategoryName =
                                      Productcategory[index].name;
                                  capturedProductCategoryID =
                                      Productcategory[index].id;
                                  // });
                                  DeleteBottomSheet(context);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ),
                    );
                  });
            }
            if (state is AddProductCategoryError) {
              return Container(
                height: deviceHeight,
                width: deviceWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.grey,
                    ),
                    NormalText(word: 'Add category')
                  ],
                ),
              );
            } else {
              // return Container(
              //   height: deviceHeight,
              //   width: deviceWidth,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: const [
              //       Icon(
              //         Icons.error,
              //         size: 50,
              //         color: Colors.grey,
              //       ),
              //       NormalText(word: 'Check your internet connection')
              //     ],
              //   ),
              // );
              // return CircularLoader();
              return Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Center(child: const CircularProgressIndicator()),
              );
            }
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

  //BottomSheet
  void DeleteBottomSheet(BuildContext context) {
    showModalBottomSheet(
        // Changes the bottomsheet overlay colour
        elevation: 3.0,
        barrierColor: Color.fromARGB(0, 77, 77, 77),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // FOr botttom sheet to no be hidden by keyboard
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AnimatedPadding(
            // Accessing padding for bottom sheet not be hidden by keyboard
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Stack(children: [
              // Container(
              //   // color: Colors.blue,
              //   height: MediaQuery.of(context).size.height * 0.2,
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  // color: Colors.red,
                ),
                child: Center(
                  child: ListView(
                    children: [
                      // BlocListener<SubjectBloc, SubjectState>(
                      //   listener: (context, state) {
                      //     // TODO: implement listener
                      //   },
                      //   child: Container(),
                      // )
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 0.0),
                        child: HeadingText(word: 'Do you want to delete'),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
                        child: MediumText(word: capturedProductCategoryName),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 0.0),
                        child: MaterialButton(
                          splashColor: Color.fromARGB(255, 18, 86, 141),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          elevation: 5.0,
                          minWidth: 200.0,
                          height: 50.0,
                          color: Colors.blue,
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            productCategoryBloc.add(
                                DeleteProductCategoryPressed(
                                    categoryID: capturedProductCategoryID));
                            Navigator.pop(context);
                            // questionnController.clear();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }
}
