import 'package:dartz/dartz.dart';
import 'package:moviestar/src/core/errors/failure.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';

abstract class IMidiaRepository {
  Future<Either<Failure, List<Filme>>> buscarFilmes({required int numeroPagina});
  Future<Either<Failure, List<Serie>>> buscarSeries({required int numeroPagina});
}