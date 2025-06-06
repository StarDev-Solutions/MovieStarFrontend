import 'package:flutter/material.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class BoxCardArtigo extends StatelessWidget {
  final Artigo artigo;

  const BoxCardArtigo({super.key, required this.artigo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorBottomNavBackground,
        borderRadius: BorderRadius.circular(20.s),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              artigo.imagePath,
              height: 200.s,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.contentTitle(artigo.title),
                UIText.excerpt(artigo.excerpt, maxLines: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
