import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class BoxCategoriaSerie extends StatelessWidget {
  final int series;

  const BoxCategoriaSerie({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    final num escala = isSmallerDevices ? 0.8 : 0.9;

    return SizedBox(
      height: 150.s5 * escala,
      width: 190.s5 * escala,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(160.s5 * escala, 140.s5 * escala),
            painter: BackgroundPainter(),
          ),
          Positioned(
            left: 10.s5 * escala,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UIText.categoryLabel('Séries'),
                UIText.quantityTitlesLabel('$series'),
              ],
            ),
          ),
          Positioned(
            top: -35.s5 * escala,
            right: 2.s5 * escala,
            child: Image.asset(
              'assets/images/midoria.png',
              width: 122.s5 * escala,
              fit: BoxFit.fitHeight,
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
    final double radius = 40;
    final Path path = Path();

    path.moveTo(radius, -8);
    path.quadraticBezierTo(0, -16, 0, 30);
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(0, size.height, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - radius);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width, 0, size.width - radius, 0);

    // Preenchimento com gradiente azul
    final paint =
        Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF2E2E),
              Color(0xFFE08939),
            ],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(Path.from(path), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
