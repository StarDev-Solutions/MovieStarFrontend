import 'package:get/get.dart';
import 'package:moviestar/src/autenticacao/presentation/pages/autenticacao_page.dart';
import 'package:moviestar/src/autenticacao/presentation/pages/cadastro_page.dart';
import 'package:moviestar/src/base/presentation/pages/widgets/box_checagem_autenticacao.dart';
import 'package:moviestar/src/midia/presentation/pages/detalhe_page.dart';
import 'package:moviestar/src/midia/presentation/pages/principal_page.dart';
import 'package:moviestar/src/base/presentation/pages/base_page.dart';
import 'package:moviestar/src/usuario/presentation/pages/historico_avaliacao_page.dart';
import 'package:moviestar/src/usuario/presentation/pages/usuario_page.dart';

abstract class Pages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.checagemRoute,
      page: () => const BoxChecagemAutenticacao(),
    ),
    GetPage(
      name: Routes.autenticacaoRoute,
      page: () => const AutenticacaoPage(),
    ),
    GetPage(
      name: Routes.cadastroRoute,
      page: () => const CadastroPage(),
    ),
    GetPage(
      name: Routes.baseRoute,
      page: () => const BasePage(),
    ),
    GetPage(
      name: Routes.principalRoute,
      page: () => const PrincipalPage(),
    ),
    GetPage(
      name: Routes.detalheRoute,
      page: () => const DetalhePage(),
    ),
    GetPage(
      name: Routes.historicoAvaliacaoRoute,
      page: () => const HistoricoAvaliacaoPage(),
    ),
    GetPage(
      name: Routes.usuarioRoute,
      page: () => const UsuarioPage(),
    ),
  ];
}

abstract class Routes {
  static const String checagemRoute = '/checagem';
  static const String autenticacaoRoute = '/autenticacao';
  static const String cadastroRoute = '/cadastro';
  static const String baseRoute = '/base';
  static const String principalRoute = '/principal';
  static const String detalheRoute = '/detalhe';
  static const String historicoAvaliacaoRoute = '/historicoAvaliacao';
  static const String usuarioRoute = '/usuario';
}
