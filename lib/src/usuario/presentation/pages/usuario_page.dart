import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/usuario/presentation/pages/widgets/box_cartaz_midia.dart';
import 'package:moviestar/src/usuario/presentation/pages/widgets/box_perfil_usuario.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: UIPadding(
          useVerticalPadding: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIPadding(
                useHorizontalPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoxPerfilUsuario(base64Avatar: '', usuario: 'John Connor'),
                    SizedBox(height: 30.s),
                    Row(
                      spacing: 15.s5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDataContainer(label: 'Assistidos',statistic: '444h'),
                        _buildDataContainer(label: 'Filmes', statistic: '200'),
                        _buildDataContainer(label: 'Episódios', statistic: '112'),
                      ],
                    ),
                    SizedBox(height: 30.s),
                    UIText.label('Listas'),
                  ],
                ),
              ),
              SizedBox(height: 10.s),
              SizedBox(
                height: 150.s3,
                child: Visibility(
                  visible: false,
                  replacement: Center(
                    ///TODO: Terminar a widget para quando não houver lista.
                    child: Image.asset('assets/images/empty.png'),
                  ),
                  child: CarouselView(
                    itemExtent: 200,
                    children: [
                      Image.asset(
                        'assets/images/placeholder_artigo.png',
                      ),
                      Image.asset(
                        'assets/images/placeholder_artigo.png',
                      ),
                      Image.asset(
                        'assets/images/placeholder_artigo.png',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.s),
              UIPadding(
                useHorizontalPadding: true,
                child: UIText.label('Filmes Favoritos'),
              ),
              SizedBox(height: 10.s),
              SizedBox(
                height: 160.s3,
                child: ListView.separated(
                  padding: getPaddingHorizontal(context),
                  separatorBuilder: (context, index) => SizedBox(width: 10.s3),
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (_, index) {
                    return TweenAnimationBuilder<Offset>(
                      duration: Duration(milliseconds: 300),
                      tween: Tween(begin: Offset(0, -1), end: Offset.zero),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, value.dy * 100),
                          child: child,
                        );
                      },
                      child: BoxCartazMidia(cartaz: ''),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.s),
              UIPadding(
                useHorizontalPadding: true,
                child: UIText.label('Séries Favoritas'),
              ),
              SizedBox(height: 10.s),
              SizedBox(
                height: 160.s3,
                child: ListView.separated(
                  padding: getPaddingHorizontal(context),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (_, index) {
                    return TweenAnimationBuilder<Offset>(
                      tween: Tween(begin: Offset(0, 1), end: Offset.zero),
                      duration: Duration(milliseconds: 300),
                      builder: (context, offset, child) {
                        return Transform.translate(
                          offset: Offset(0, offset.dy * 100),
                          child: child,
                        );
                      },
                      child: BoxCartazMidia(cartaz: ''),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.s),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildDataContainer({required String statistic, required String label}) {
    return Container(
      width: 80.s3,
      height: 56.s3,
      decoration: BoxDecoration(
        color: colorSecondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [UIText.label(statistic), UIText.label(label)],
      ),
    );
  }
}