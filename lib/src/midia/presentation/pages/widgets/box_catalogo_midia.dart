import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:intl/intl.dart';

class BoxCatalogoMidia extends StatelessWidget {
  final Midia midia;
  const BoxCatalogoMidia({super.key, required this.midia});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Hero(
            tag: midia.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/placeholder_midia.png'),
              image: MemoryImage(base64Decode(midia.cartaz)),
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
        UIText.contentTitle(
          midia.titulo,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        Text(dateTimeToDate(midia.dataLancamento), style: dataLancamentoStyle, maxLines: 1),
      ],
    );
  }

  String dateTimeToDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
