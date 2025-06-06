import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class HistoricoAvaliacaoPage extends StatefulWidget {
  const HistoricoAvaliacaoPage({super.key});

  @override
  State<HistoricoAvaliacaoPage> createState() => _HistoricoAvaliacaoPageState();
}

class _HistoricoAvaliacaoPageState extends State<HistoricoAvaliacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UIPadding(
        useVerticalPadding: true,
        useHorizontalPadding: true,
        child: Column(
          children: [
            UIText.label('Últimas avaliações'),
          ],
        ),
        
        ),
    );
  }
}