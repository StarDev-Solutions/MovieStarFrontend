import 'package:flutter/material.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:moviestar/src/blog/presentation/controllers/blog_controller.dart';
import 'package:moviestar/src/blog/presentation/widgets/box_card_artigo.dart';
import 'package:moviestar/src/blog/presentation/widgets/box_busca_artigo.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:get/get.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> with SingleTickerProviderStateMixin {
  late FocusNode focusNode;
  late AnimationController _animationController;
  late CurvedAnimation _opacityAnimation;
  late Animation<Offset> _offsetTtoB;

  final BlogController _blogController = Get.find<BlogController>();

  @override
  void initState() {
    focusNode = FocusNode();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _offsetTtoB = Tween(begin: Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _blogController.buscarArtigos(numeroPagina: 1);
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UIPadding(
        useVerticalPadding: true,
        useHorizontalPadding: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _opacityAnimation,
              child: UIText.label('Pesquisar pelo título'),
            ),
            SizedBox(height: 15.s),
            SlideTransition(
              position: _offsetTtoB,
              child: BoxBuscaArtigo(
                selecionarArtigo: selectPost,
              ),
            ),
            SizedBox(height: 20.s),
            Obx(() {
                return Skeletonizer(
                  enabled: _blogController.state == NotifierState.loading,
                  child: Flexible(
                    child: ListView.separated(
                      padding: isMobile ? EdgeInsets.only(bottom: 100) : null,
                      separatorBuilder: (_, _) => SizedBox(height: 20),
                      itemCount: _blogController.artigos.length,
                      itemBuilder: (_, index) {
                      return TweenAnimationBuilder(
                        tween: Tween(begin: Offset(1, 0), end: Offset.zero),
                        duration: Duration(milliseconds: 300),
                        builder: (context, offset, child) {
                          return Transform.translate(
                            offset: Offset(offset.dx * 100, 0),
                            child: child,
                          );
                        },
                        child: BoxCardArtigo(
                          artigo: _blogController.artigos[index],
                        ),
                      );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void selectPost(Artigo blogPost) => _blogController.selecionarArtigo(blogPost);
}
