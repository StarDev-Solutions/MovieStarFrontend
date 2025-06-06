import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:moviestar/src/base/presentation/pages/widgets/box_icone.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/core/utils/formatter.dart';
import 'package:rive/rive.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BoxPerfilUsuario extends StatefulWidget {
  final String base64Avatar;
  final String usuario;

  const BoxPerfilUsuario({
    super.key,
    required this.base64Avatar,
    required this.usuario,
  });

  @override
  State<BoxPerfilUsuario> createState() => _BoxPerfilUsuarioState();
}

class _BoxPerfilUsuarioState extends State<BoxPerfilUsuario> {
  StateMachineController? _riveController;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: colorSecondary),
            boxShadow: [
              BoxShadow(
                color: colorPrimary.withValues(alpha: 0.4),
                blurRadius: 14,
                spreadRadius: 1,
                offset: const Offset(-3, -3),
              ),
              BoxShadow(
                color: colorSecondary.withValues(alpha: 0.4),
                blurRadius: 14,
                spreadRadius: 1,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Visibility(
                visible: false,
                replacement: Skeletonizer(
                  enabled: _riveController == null,
                  child: Skeleton.leaf(
                    child: CircleAvatar(
                      radius: 45.s6,
                      backgroundColor: colorPrimary,
                      child: ClipOval(
                        child: RiveAnimation.asset(
                          'assets/rive/avatar.riv',
                          artboard: 'Artboard',
                          onInit: (artboard) {
                            _riveController = StateMachineController.fromArtboard(
                              artboard,
                              'StateMachine',
                            );
                            if (_riveController != null) {
                              setState(
                                () => artboard.addController(_riveController!),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                child: CircleAvatar(
                  radius: 45.s6,
                  backgroundImage: MemoryImage(
                    Formatter.imagemBase64(widget.base64Avatar) ?? Uint8List(0),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(5.s),
                  decoration: BoxDecoration(
                    color: colorBottomNavBackground,
                    shape: BoxShape.circle,
                  ),
                  child: BoxIcone(icone: Icons.edit, cor: colorPrimary, tamanho: 18.s6),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.s),
        UIText.label2(widget.usuario),
      ],
    );
  }
}
