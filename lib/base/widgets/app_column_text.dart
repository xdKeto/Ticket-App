import 'package:flutter/cupertino.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class TextColumnLayout extends StatelessWidget {
  final String topText;
  final String botText;
  final CrossAxisAlignment alignment;

  const TextColumnLayout({super.key, required this.topText, required this.botText, required this.alignment });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        TextStyleThird(text: topText),
        SizedBox(
          height: 5,
        ),
        TextStyleFourth(
          text: botText,
        )
      ],
    );
  }
}
