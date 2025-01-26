import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  const ModifiedText({
    super.key,
    required this.text,
    this.color = Colors.white,
    required this.fontSize,
    this.maxLine = 2,
  });

  final String text;
  final Color color;
  final double fontSize;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(color: color, fontSize: fontSize),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
      maxLines: maxLine,
    );
  }
}
