import 'package:flutter/material.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class BoxBuscaArtigo extends StatefulWidget {
  final void Function(Artigo artigo) selecionarArtigo;

  const BoxBuscaArtigo({super.key, required this.selecionarArtigo});

  @override
  State<BoxBuscaArtigo> createState() => _BoxBuscaArtigoState();
}

class _BoxBuscaArtigoState extends State<BoxBuscaArtigo> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [colorPrimary, colorSecondary],
        ),
        borderRadius: BorderRadius.circular(20),
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SearchBar(
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            backgroundColor: WidgetStatePropertyAll(colorBackground),
          );
        }
      ),
    );
  }
}
