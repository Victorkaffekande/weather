import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Size { small, medium, large, giga }

class WeatherText extends StatelessWidget {
  final String text;
  final Size size;
  final FontWeight fontWeight;

  const WeatherText({
    Key? key,
    required this.text,
    required this.size,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  double textSize() {
    switch (size) {
      case Size.small:
        return 14;
      case Size.medium:
        return 20;
      case Size.large:
        return 35;
      case Size.giga:
        return 85;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: textSize(),
        fontWeight: fontWeight,
        color: Colors.white,
      ),
    );
  }
}
