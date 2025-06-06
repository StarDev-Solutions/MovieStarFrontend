import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/src/autenticacao/presentation/controllers/autenticacao_controller.dart';
import 'package:moviestar/src/autenticacao/presentation/pages/autenticacao_page.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';
import 'package:moviestar/src/base/presentation/pages/base_page.dart';

class BoxChecagemAutenticacao extends StatelessWidget {
  const BoxChecagemAutenticacao({super.key});

  @override
  Widget build(BuildContext context) {
    final AutenticacaoController autenticacaoController = Get.find<AutenticacaoController>();
    return Obx(() {
        ///Gerencia oque deve fazer dependendo em que estado se encontra o auth(usuário).
        if (autenticacaoController.state == NotifierState.loading) {
          return _loading();
        } else if (autenticacaoController.usuario == null) {
          return const AutenticacaoPage();
        } else {
          return const BasePage();
        }
      },
    );
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }
}
