import 'package:flutter/material.dart';
import 'package:pos/presentation/screens/product_categories.dart';
import 'package:pos/presentation/widgets/text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
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
              child: NormalText(word: categoryName),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}
