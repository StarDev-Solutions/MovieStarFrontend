import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';

class BoxCartazMidia extends StatelessWidget {
  final String cartaz;

  const BoxCartazMidia({super.key, required this.cartaz});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 7.s3,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: FadeInImage(
            placeholder: AssetImage('assets/images/placeholder_midia.png'),
            image: AssetImage('assets/images/placeholder_midia.png'),
            width: 100.s3,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}