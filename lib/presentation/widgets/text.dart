import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  const SmallText({Key? key, required this.word}) : super(key: key);
  final String word;

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 92, 92, 92),
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}

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

class MediumText extends StatelessWidget {
  const MediumText({Key? key, required this.word}) : super(key: key);
  final String word;
  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 92, 92, 92),
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 20,
        fontWeight: FontWeight.w700,
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
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
