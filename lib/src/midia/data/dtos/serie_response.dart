import 'package:moviestar/src/midia/domain/entities/midia.dart';

class SerieResponse extends Serie {
  const SerieResponse({
    required super.id,
    required super.titulo,
    required super.sinopse,
    required super.cartaz,
    required super.dataLancamento,
    required super.nota,
    required super.temporadas,
    required super.episodios,
  });

  factory SerieResponse.fromJson(Map<String, dynamic> json) {
    return SerieResponse(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      sinopse: json['sinopse'] as String,
      cartaz: json['cartaz'] as String,
      dataLancamento: DateTime.parse(json['dataLancamento'] as String),
      nota: (json['nota'] as num),
      temporadas: (json['temporadas'] as int),
      episodios: (json['episodios'] as int),
    );
  }
}