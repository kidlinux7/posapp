import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/data/repositories/product_category_repository.dart';
import 'package:pos/logic/bloc/product_category_bloc.dart';
import 'package:pos/presentation/screens/product_categories.dart';
import 'package:pos/presentation/widgets/text.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late final ProductCategoryBloc productCategoryBloc;
  final ProductCategoryRepository productCategoryRepository =
      ProductCategoryRepository();

  final _formKey = GlobalKey<FormState>();
  final categoryname = TextEditingController();

  @override
  void initState() {
    productCategoryBloc = ProductCategoryBloc(
        productCategoryRepository: productCategoryRepository);
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue, size: 30.0),
          elevation: 0.0,
          title: const HeadingText(word: 'Add Product Category')),
      body: BlocListener<ProductCategoryBloc, ProductCategoryState>(
        bloc: productCategoryBloc,
        listener: (context, state) {
          if (state is AddProductCategoryAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Product Category Added')));
            Navigator.pop(context);
          }
          if (state is AddProductCategoryLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Loading')));
          }
          if (state is AddProductCategoryError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Failed to Add Product Category')));
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.07,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.19,
              ),
              child: TextFormField(
                controller: categoryname,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // suffixIcon: const Icon(
                  //   Icons.done_rounded,
                  //   color: Colors.green,
                  // ),
                  hintText: 'Category name',
                  // helperText: 'eg. +255765XXXXXX',
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    color: Colors.black38,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.all(8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Category name is required';
                  }
                  return null;
                },
                // onChanged: (value) {
                //   _phoneBloc.add(PhoneValidation(phone: value));
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: InkWell(
                  splashColor: const Color.fromARGB(255, 12, 83, 141),
                  onTap: () {
                    if (categoryname.text.isEmpty ||
                        categoryname.text == null ||
                        categoryname.text.length < 4) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please add a valid category name')));
                    } else {
                      productCategoryBloc.add(AddProductCategoryPressed(
                          categoryName: categoryname.text));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: deviceWidth * 0.6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // gradient: LinearGradient(
                      //   begin: Alignment.centerLeft,
                      //   end: Alignment.centerRight,
                      //   colors: [
                      //     Color.fromRGBO(93, 42, 225, 1),
                      //     Color.fromRGBO(34, 6, 107, 1)
                      //   ],
                      // ),
                      color: Colors.blue,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Add',
                          textScaleFactor: 1,
                          style: TextStyle(
                            // fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
