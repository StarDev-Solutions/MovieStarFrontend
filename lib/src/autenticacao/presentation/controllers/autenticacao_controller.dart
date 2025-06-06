import 'package:get/get.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';

class AutenticacaoController extends GetxController {
  final Rx<NotifierState> _state = Rx(NotifierState.initial);
  NotifierState get state => _state.value;

  final Rxn<String?> _usuario = Rxn();
  String? get usuario => _usuario.value;

  ///TODO: Implementar método de login.
  void entrar() => _usuario.value = 'Novo usuário';

  ///TODO: Implementar método de cadastro.
  void cadastrar() {
    entrar();
  }
}