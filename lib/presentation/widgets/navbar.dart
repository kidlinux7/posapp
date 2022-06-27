import 'package:flutter/material.dart';
import 'package:pos/presentation/screens/home.dart';
import 'package:pos/presentation/screens/product_categories.dart';
import 'package:pos/presentation/screens/products.dart';
import 'package:pos/presentation/screens/reports.dart';
import 'package:pos/presentation/screens/sales.dart';
import 'package:pos/presentation/widgets/text.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

int _selectPage = 0;
final _pageOptions = [
  const Home(),
  const Products(),
  const Sales(),
  const Reports()
];

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectPage,
        children: _pageOptions,
      ),
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue, size: 30.0),
          elevation: 0.0,
          title: const HeadingText(word: 'POS')),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 201, 201, 201),
              ),
              child: NormalText(word: ''),
            ),
            ListTile(
              title: const NormalText(word: 'Categories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductCategories()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        selectedItemColor: const Color.fromARGB(255, 88, 76, 255),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectPage,
        onTap: (int index) {
          setState(() {
            _selectPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: '',
          ),
        ],
      ),
    );
  }
}
