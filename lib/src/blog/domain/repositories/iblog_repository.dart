import 'package:dartz/dartz.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:moviestar/src/core/errors/failure.dart';

abstract class IBlogRepository {
  Future<Either<Failure, List<Artigo>>> buscarArtigos({required int numeroPagina});
}