import 'package:equatable/equatable.dart';

sealed class Midia extends Equatable {
  final String id;
  final String titulo;
  final String sinopse;
  final String cartaz;
  final DateTime dataLancamento;
  final num nota;
  
  const Midia({
    required this.id,
    required this.titulo,
    required this.sinopse,
    required this.cartaz,
    required this.dataLancamento,
    required this.nota,
  });
  
  @override
  List<Object?> get props => [id, titulo, sinopse, cartaz, dataLancamento, nota];
}

class Filme extends Midia {
  final num duracao;

  const Filme({
    required super.id,
    required super.titulo,
    required super.sinopse,
    required super.cartaz,
    required super.dataLancamento,
    required super.nota,
    required this.duracao,
  });

  @override
  List<Object?> get props => super.props..add(duracao);
}


class Serie extends Midia {
  final int temporadas;
  final int episodios;

  const Serie({
    required super.id,
    required super.titulo,
    required super.sinopse,
    required super.cartaz,
    required super.dataLancamento,
    required super.nota,
    required this.temporadas,
    required this.episodios,
  });

  @override
  List<Object?> get props => super.props..add(temporadas)..add(episodios);
}