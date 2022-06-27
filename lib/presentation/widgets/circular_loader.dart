import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(deviceHeight * 0.4),
      child: const CircularProgressIndicator(
        color: Colors.grey,
      ),
    );
  }
}
