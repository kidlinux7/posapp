import 'package:flutter/material.dart';
import 'package:pos/presentation/widgets/text.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NormalText(word: 'Inventory'),
    );
  }
}
