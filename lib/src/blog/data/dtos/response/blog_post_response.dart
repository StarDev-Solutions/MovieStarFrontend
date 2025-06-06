import 'package:moviestar/src/blog/domain/entities/blog_post.dart';

class BlogPostResponse extends Artigo {
  const BlogPostResponse({required super.imagePath, required super.title, required super.excerpt, required super.htmlContent});

  factory BlogPostResponse.fromJson(Map<String, dynamic> json) {
    return BlogPostResponse(
      imagePath: json['imagePath'],
      title: json['title'],
      excerpt: json['excerpt'],
      htmlContent: json['content'],
    );
  }
}