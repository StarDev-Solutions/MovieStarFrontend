import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class BoxCategoriaFilme extends StatelessWidget {
  final int filmes;

  const BoxCategoriaFilme({super.key, required this.filmes});

  @override
  Widget build(BuildContext context) {
    final num escala = isSmallerDevices ? 0.8 : 0.9;

    return SizedBox(
      height: 150.s5 * escala,
      width: 190.s5 * escala,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 27.s5 * escala,
            child: CustomPaint(
              size: Size(160.s5 * escala, 140.s5 * escala),
              painter: BackgroundPainter(),
            ),
          ),
          Positioned(
            top: -15.s5 * escala,
            child: Image.asset(
              'assets/images/spider_man.png',
              width: 155.s5 * escala,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            right: 10.s5 * escala,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UIText.categoryLabel('Filmes'),
                UIText.quantityTitlesLabel('$filmes'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = 40.0;
    final path = Path();

    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, -10);
    path.quadraticBezierTo(size.width, -15, size.width, 30);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // Preenchimento com gradiente azul
    final paint = Paint()
          ..shader = const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF16CAF1), Color(0xFF0143A7)],
            ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)
          );

    canvas.drawPath(Path.from(path), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
