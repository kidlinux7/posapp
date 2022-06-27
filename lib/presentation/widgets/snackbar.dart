import 'package:flutter/material.dart';

class Snackbar extends StatelessWidget {
  const Snackbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text('Category not added'),);
  }
}
