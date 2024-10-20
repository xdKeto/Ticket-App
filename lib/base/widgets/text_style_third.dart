import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class TextStyleThird extends StatelessWidget {
  final TextAlign align;
  final String text;
  final bool? isColor;
  const TextStyleThird(
      {super.key,
      required this.text,
      this.align = TextAlign.start,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: isColor == null
          ? AppStyles.headLineStyle3.copyWith(color: Colors.white)
          : AppStyles.headLineStyle3,
    );
  }
}
