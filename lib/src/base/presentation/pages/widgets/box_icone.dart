import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class BoxIcone extends StatelessWidget {
  final Color? cor;
  final double? tamanho;
  final IconData? icone;

  const BoxIcone({
    super.key,
    this.cor,
    this.tamanho,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      size: tamanho ?? 24.s2,
      color: cor,
      icone,
    );
  }
}