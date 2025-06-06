import 'package:flutter/material.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';

class BoxCardGenero extends StatelessWidget {
  final Midia movieModel;
  
  const BoxCardGenero({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 250,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(movieModel.cartaz), //TODO - TROCAR A IMAGEM
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: Text(
            movieModel.titulo, //TODO - TROCAR TÍTULO
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}