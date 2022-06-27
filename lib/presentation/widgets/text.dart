import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalText extends StatelessWidget {
  const NormalText({Key? key, required this.word}) : super(key: key);
  final String word;
  // final Colors colorz;
  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 92, 92, 92),
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 17,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({Key? key, required this.word}) : super(key: key);
  final String word;
  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 131, 131, 131),
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 25,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}