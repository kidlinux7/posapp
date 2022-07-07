import 'package:flutter/material.dart';
import 'package:pos/presentation/widgets/text.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
        body: const Center(
          child: NormalText(word: 'Products'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
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
            child: const Icon(Icons.add)));
  }
}
