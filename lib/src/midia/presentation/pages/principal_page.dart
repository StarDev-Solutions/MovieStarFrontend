import 'package:flutter/material.dart';
import 'package:moviestar/src/core/route.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';
import 'package:moviestar/src/midia/presentation/controllers/midia_controller.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/box_categoria_serie.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/box_catalogo_midia.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/box_categoria_filme.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/box_busca_midia.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:get/get.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> with SingleTickerProviderStateMixin {
  late CarouselController _carouselController;
  late FocusNode focusNode;
  late AnimationController _animationController;
  late CurvedAnimation _opacityAnimation;
  late Animation<Offset> _offsetTtoB;
  late Animation<Offset> _offsetLtoR;
  late Animation<Offset> _offsetRtoL;
  late MidiaController _midiaController;

  @override
  void initState() {
    ///TODO: Ajustar lógica para começar no segundo item do carrossel.
    _carouselController = CarouselController();
    _midiaController = Get.find<MidiaController>();
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
    _offsetLtoR = Tween(begin: Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _offsetRtoL = Tween(begin: Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        _midiaController.buscarFilmes(numeroPagina: 1),
        _midiaController.buscarSeries(numeroPagina: 1),
      ]);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              UIPadding(
                useHorizontalPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.label('Pesquisar pelo título'),
                    SizedBox(height: 15.s),
                    SlideTransition(
                      position: _offsetTtoB,
                      child: BoxBuscaMidia(
                        searchFocusNode: focusNode,
                        midia: _midiaController.filmesPopulares,
                        sugestaoSelecionada: _selecionarMidia,
                      ),
                    ),
                    SizedBox(height: 30.s),
                    FadeTransition(
                      opacity: _opacityAnimation,
                      child: Text('Categorias', style: labelStyle),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.s),
              Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10.s3,
                    children: [
                      SlideTransition(
                        position: _offsetLtoR,
                        child: BoxCategoriaFilme(filmes: _midiaController.filmesPopulares.length),
                      ),
                      SlideTransition(
                        position: _offsetRtoL,
                        child: BoxCategoriaSerie(series: _midiaController.seriesPopulares.length),
                      ),
                    ],
                  );
                }
              ),
              SizedBox(height: 15.s),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIPadding(
                    useHorizontalPadding: true,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: Text('Populares', style: labelStyle),
                    ),
                  ),
                  SizedBox(height: 15.s),
                  Obx(() {
                      return Skeletonizer(
                        enabled: _midiaController.state == NotifierState.loading,
                        child: SizedBox(
                          height: 220.s,
                          child: CarouselView.weighted(
                            controller: _carouselController,
                            enableSplash: false,
                            onTap: (index) => _selecionarMidia(_midiaController.midiasPopulares[index]),
                            flexWeights: [2, 3, 3, 2],
                            itemSnapping: true,
                            children: _midiaController.state == NotifierState.loading
                                    ? List.generate(
                                      4,
                                      (index) => Skeleton.leaf(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(14)
                                          ),
                                          width: 100,
                                        ),
                                      ),
                                    )
                                    : _midiaController.midiasPopulares.map((midia) {
                                      return TweenAnimationBuilder<Offset>(
                                        duration: Duration(milliseconds: 600),
                                        tween: Tween(begin: Offset(1, 0), end: Offset.zero),
                                        builder: (context, value, child) {
                                          return Transform.translate(
                                            offset: value,
                                            child: BoxCatalogoMidia(midia: midia),
                                          );
                                        }
                                      );
                                    }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selecionarMidia(Midia midia) {
    _midiaController.selecionarMidia(midia);
    Get.toNamed(Routes.detalheRoute);
  }
}
