import 'package:moviestar/src/midia/domain/entities/midia.dart';

class FilmeResponse extends Filme {
  const FilmeResponse({
    required super.id,
    required super.titulo,
    required super.sinopse,
    required super.cartaz,
    required super.dataLancamento,
    required super.nota,
    required super.duracao,
  });

  factory FilmeResponse.fromJson(Map<String, dynamic> json) {
    return FilmeResponse(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      sinopse: json['sinopse'] as String,
      cartaz: json['cartaz'] as String,
      dataLancamento: DateTime.parse(json['dataLancamento'] as String),
      nota: (json['nota'] as num),
      duracao: (json['duracao'] as num),
    );
  }
}