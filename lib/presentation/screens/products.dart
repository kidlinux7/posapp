import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/data/models/product_category_model.dart';
import 'package:pos/data/models/product_model.dart';
import 'package:pos/data/repositories/product_category_repository.dart';
import 'package:pos/data/repositories/product_repository.dart';
import 'package:pos/logic/bloc/product/product_bloc.dart';
import 'package:pos/logic/bloc/product_category/product_category_bloc.dart';
import 'package:pos/presentation/widgets/text.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late final ProductCategoryBloc productCategoryBloc;
  late final ProductBloc productBloc;

  final ProductCategoryRepository productCategoryRepository =
      ProductCategoryRepository();
  final ProductRepository productRepository = ProductRepository();

  @override
  void initState() {
    productCategoryBloc = ProductCategoryBloc(
        productCategoryRepository: productCategoryRepository);
    productCategoryBloc.add(const FetchProductCategory());

    productBloc = ProductBloc(productRepository: productRepository);
    productBloc.add(const FetchProduct());
    super.initState();
  }

  @override
  void dispose() {
    productCategoryBloc.dispose();
    productBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        DefaultTabController(
          length: 1,
          child: Scaffold(
              // backgroundColor: Color.fromARGB(255, 255, 255, 255),
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.blue, size: 30.0),
                elevation: 0.0,
                title: const HeadingText(word: 'Products'),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      tooltip: 'Search for product',
                      onPressed: (() {
                        print('object');
                      }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: IconButton(
                      icon: Icon(Icons.sort),
                      tooltip: 'Sort products',
                      onPressed: (() {
                        print('object');
                      }),
                    ),
                  ),
                ],
                bottom: PreferredSize(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                      child: Container(
                          height: 40.0,
                          width: deviceWidth,
                          child: BlocBuilder<ProductCategoryBloc,
                                  ProductCategoryState>(
                              bloc: productCategoryBloc,
                              builder: (context, state) {
                                if (state is ProductCategoryLoaded) {
                                  List<ProductCategoryModel> Productcategory =
                                      state.productcategory;
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: Productcategory.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 0, 0.0, 14.0),
                                          child: MaterialButton(
                                            focusElevation: 1.0,
                                            elevation: 0.0,
                                            splashColor: Color.fromARGB(
                                                255, 178, 220, 255),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            minWidth: 100.0,
                                            height: 30.0,
                                            color: Color.fromARGB(
                                                255, 243, 243, 243),
                                            child: SmallText(
                                                word: Productcategory[index]
                                                    .name),
                                            onPressed: () {
                                              null;
                                            },
                                          ),
                                        );
                                      });
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Center(
                                      child: const CircularProgressIndicator()),
                                );
                              })),
                    ),
                    preferredSize: Size.square(60.0)),
              ),
              body: BlocConsumer<ProductBloc, ProductState>(
                listener: ((context, state) {}),
                builder: (context, state) {
                  if (state is ProductLoaded) {
                    List<ProductModel> Product = state.productlist;
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: Product.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              elevation: 0.0,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  productDetailsBottomSheet(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Segment one
                                      Row(
                                        children: [
                                          Container(
                                            height: 90,
                                            width: 100,
                                            color: Color.fromARGB(
                                                255, 228, 228, 228),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Column(
                                            children: [
                                              MediumText(
                                                  word: Product[index].name),
                                              SmallText(
                                                  word: Product[index].brand)
                                            ],
                                          )
                                        ],
                                      ),

                                      // Segment two
                                      Column(
                                        children: [
                                          NormalText(
                                              word: (Product[index].minQuantity)
                                                  .toString())
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Center(child: const CircularProgressIndicator()),
                  );
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniEndFloat,
              floatingActionButton: FloatingActionButton(
                  // isExtended: true,
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    // AddBottomSheet(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const AddCategory()),
                    // );
                  },
                  // isExtended: true,
                  child: const Icon(Icons.add))),
        ),
      ],
    );
  }

  //Product Details BottomSheet
  void productDetailsBottomSheet(BuildContext context) {
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
                height: MediaQuery.of(context).size.height * 0.5,
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
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 300,
                              width: 200,
                              color: Colors.grey,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product Name
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 8.0, 0.0, 7.0),
                                  child: Row(
                                    children: [
                                      NormalText(word: 'Name : '),
                                      MediumText(word: 'Pepsi'),
                                    ],
                                  ),
                                ),

                                // Product Brand
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 8.0, 0.0, 7.0),
                                  child: Row(
                                    children: [
                                      NormalText(word: 'Brand : '),
                                      MediumText(word: 'Pepsi'),
                                    ],
                                  ),
                                ),

                                // Product Specifications
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 8.0, 0.0, 7.0),
                                  child: Row(
                                    children: [
                                      NormalText(word: 'Specifications : '),
                                      MediumText(word: '350ml'),
                                    ],
                                  ),
                                ),

                                // Product Stock
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 8.0, 0.0, 7.0),
                                  child: Row(
                                    children: [
                                      NormalText(word: 'Stocked : '),
                                      MediumText(word: 'Pepsi'),
                                    ],
                                  ),
                                ),

                                // Product Quantity
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 8.0, 0.0, 7.0),
                                  child: Row(
                                    children: [
                                      NormalText(word: 'Min quantity : '),
                                      MediumText(word: '350'),
                                    ],
                                  ),
                                ),

                                // Product Wholesale Price
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 8.0, 0.0, 7.0),
                                  child: Row(
                                    children: [
                                      NormalText(word: 'Wholesale price : '),
                                      MediumText(word: '450.00'),
                                    ],
                                  ),
                                ),

                                // Product Retail Price
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 8.0, 0.0, 7.0),
                                  child: Row(
                                    children: [
                                      NormalText(word: 'Retail price : '),
                                      MediumText(word: '550.0'),
                                    ],
                                  ),
                                ),

                                // Product Date Added
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 8.0, 0.0, 7.0),
                                  child: Row(
                                    children: [
                                      NormalText(word: 'Date added : '),
                                      MediumText(word: '2020/02/02'),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 0.0),
                        child: MaterialButton(
                          splashColor: Color.fromARGB(255, 109, 109, 109),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          elevation: 5.0,
                          minWidth: 200.0,
                          height: 50.0,
                          color: Colors.grey,
                          child: Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            // questionnController.clear();
                          },
                        ),
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
