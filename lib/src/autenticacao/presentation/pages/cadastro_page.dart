import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/src/autenticacao/presentation/controllers/autenticacao_controller.dart';
import 'package:moviestar/src/autenticacao/presentation/pages/widgets/box_campo_texto.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/base/presentation/pages/widgets/box_botao_primario.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final AutenticacaoController _autenticacaoController = Get.find<AutenticacaoController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmacaoSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 60.s3,
            children: [
              _buildLogo(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 30.s3,
                    children: [
                      BoxCampoTexto(
                        controller: _emailController,
                        label: 'E-mail',
                        hintText: 'Insira seu email...',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          return null;
                        },
                      ),
                      BoxCampoTexto(
                        controller: _senhaController,
                        isPassword: true,
                        label: 'Senha',
                        hintText: 'Insira sua senha...',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                      BoxCampoTexto(
                        controller: _confirmacaoSenhaController,
                        isPassword: true,
                        label: 'Repita sua senha',
                        hintText: 'Repita sua senha...',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                      BoxBotaoPrimario(
                        text: 'Cadastrar',
                        onPressed: () => _autenticacaoController.cadastrar(),
                      ),
                      TextButton(onPressed: () => Get.back(), child: UIText.labelUsuarios('Já tem uma conta? Entre'))
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    ); 
  }

  ///Método para construir a logo do aplicativo.
  Widget _buildLogo() {
    return Hero(
      tag: 'logo',
      child: Container(
        width: 200.s2,
        height: 200.s2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor.withValues(alpha: 0.9),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.elasticOut,
            builder: (_, value, _) {
              return Transform.scale(
                scale: value,
                child: Image.asset('assets/images/logo.png')
              );
            },
          ),
        ),
      ),
    );
  }
}