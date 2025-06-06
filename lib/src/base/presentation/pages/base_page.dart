import 'package:flutter/material.dart';
import 'package:moviestar/src/base/domain/entities/nav_item_model.dart';
import 'package:moviestar/src/base/domain/entities/rive_model.dart';
import 'package:moviestar/src/midia/presentation/pages/principal_page.dart';
import 'package:moviestar/src/base/presentation/pages/widgets/box_barra_selecao_animada.dart';
import 'package:moviestar/src/blog/presentation/blog_page.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/usuario/presentation/pages/historico_avaliacao_page.dart';
import 'package:moviestar/src/usuario/presentation/pages/usuario_page.dart';
import 'package:rive/rive.dart' as r;

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _selectedNavIndex = 0;
  final List<r.SMIBool> _riveIconInputs = [];

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1400));
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              PrincipalPage(),
              BlogPage(),
              HistoricoAvaliacaoPage(),
              UsuarioPage(),
            ],
          ),
          Positioned(
            bottom: 15,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Container(
                height: 55.s3,
                width: MediaQuery.sizeOf(context).width / 1.2,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 30.s3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.s),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorBottomNavBackground..withValues(alpha: 0.2),
                      colorBottomNavBackground.withValues(alpha: 0.8),
                    ],
                  )
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(bottomNavItems.length, (index) {
                  final RiveModel riveIcon = bottomNavItems[index].rive;
                  
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BoxBarraSelecaoAnimada(isActive: _selectedNavIndex == index),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          _animateIcon(index);
                          setState(() => _selectedNavIndex = index);
                          _pageController.jumpToPage(index);
                        },
                        child: SizedBox(
                          height: 25.s3,
                          width: 25.s3,
                          child: Opacity(
                            opacity: _selectedNavIndex == index ? 1 : 0.5,
                            child: r.RiveAnimation.asset(
                              riveIcon.src,
                              artboard: riveIcon.artboard,
                              onInit: (artboard) => _riveOnIt(artboard, stateMachineName: riveIcon.stateMachineName),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }

  void _riveOnIt(r.Artboard artboard, {required String stateMachineName}) {
    r.StateMachineController? controller = r.StateMachineController.fromArtboard(
      artboard,
      stateMachineName,
    );
    if (controller != null) {
      artboard.addController(controller);
      _riveIconInputs.add(controller.findInput<bool>('active') as r.SMIBool);
    }
  }
  
  void _animateIcon(int index) {
    _riveIconInputs[index].change(true);
    Future.delayed(Duration(seconds: 1), () => _riveIconInputs[index].change(false));
  }
}
