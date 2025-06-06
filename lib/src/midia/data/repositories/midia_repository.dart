import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:moviestar/src/base/data/mock/mock_data.dart';
import 'package:moviestar/src/base/data/repositories/base_repository.dart';
import 'package:moviestar/src/core/errors/failure.dart';
import 'package:moviestar/src/midia/data/dtos/filme_response.dart';
import 'package:moviestar/src/midia/data/dtos/serie_response.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';
import 'package:moviestar/src/midia/domain/repositories/imidia_repository.dart';

class MidiaRepository extends BaseRepository implements IMidiaRepository {
  MidiaRepository() {
    configureDio(Get.find<Dio>());
  }
  
  @override
  Future<Either<Failure, List<Filme>>> buscarFilmes({required int numeroPagina}) async {
    try {
      final List<Filme> result = (filmes['data'] as List).map((json) => FilmeResponse.fromJson(json)).toList();
      return Right(result);
    } catch (error) {
      return Left(checkError(error));
    }
  }

  @override
  Future<Either<Failure, List<Serie>>> buscarSeries({required int numeroPagina}) async {
    try {
      final List<Serie> result = (series['data'] as List).map((json) => SerieResponse.fromJson(json)).toList();
      return Right(result);
    } catch (error) {
      return Left(checkError(error));
    }
  }
}