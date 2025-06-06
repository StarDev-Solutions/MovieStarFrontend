import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviestar/src/base/data/mock/mock_data.dart';
import 'package:moviestar/src/base/data/repositories/base_repository.dart';
import 'package:moviestar/src/blog/data/dtos/response/blog_post_response.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:moviestar/src/blog/domain/repositories/iblog_repository.dart';
import 'package:moviestar/src/core/errors/failure.dart';
import 'package:get/get.dart';

class BlogRepository extends BaseRepository implements IBlogRepository {
  BlogRepository() {
    configureDio(Get.find<Dio>());
  }

  @override
  Future<Either<Failure, List<Artigo>>> buscarArtigos({required int numeroPagina}) async {
    try {
      // final String url = '';
      // final response = await Get.find<Dio>().get(url);
      // final List<BlogPost> result = (response.data as List).map((json) => BlogPostResponse.fromJson(json)).toList(); 

      final List<Artigo> result = (artigos['data'] as List).map((json) => BlogPostResponse.fromJson(json)).toList();
      return Right(result);
    } catch (error) {
      return Left(checkError(error));
    }
  }
}