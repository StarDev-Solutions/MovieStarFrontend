import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/core/utils/formatter.dart';

class BoxElenco extends StatelessWidget {
  final String imagem;
  final String nome;
  final String personagem;

  const BoxElenco({
    super.key,
    required this.imagem,
    required this.nome,
    required this.personagem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245.s3,
      child: Stack(
        children: [
          Positioned(
            left: 30.s3,
            child: Card(
              shadowColor: Color(0xff5E5E5E),
              elevation: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7.s3, horizontal: 40.s3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.nomeAtor(nome),
                    UIText.nomePersonagem(personagem),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [colorPrimary, colorSecondary],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 32.s3,
              backgroundImage: MemoryImage(Formatter.imagemBase64(imagem)!),
            ),
          ),
        ],
      ),
    );
  }
}
