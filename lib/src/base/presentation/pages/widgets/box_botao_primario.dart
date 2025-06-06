import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class BoxBotaoPrimario extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const BoxBotaoPrimario({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [colorPrimary, colorSecondary],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withValues(alpha: 0.4),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(-3, -3),
            ),
            BoxShadow(
              color: colorSecondary.withValues(alpha: 0.4),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.s3)),
            padding: EdgeInsets.symmetric(horizontal: 16.s3, vertical: 10.s3),
          ),
          child: UIText.primaryButtonStyle(text),
        ),
      ),
    );
  }
}
