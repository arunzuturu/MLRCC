import 'package:flutter/material.dart';
import 'package:mlrcc/theme/pallete.dart';

class SectionChip extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  const SectionChip({
    super.key,
    required this.title,
    this.backgroundColor = Pallete.orangeColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
        child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 13, letterSpacing: 1.2, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}