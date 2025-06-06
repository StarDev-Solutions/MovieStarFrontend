import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//Valores padrao utilizado no sistema de resposividade
const int totalColumns = 15;
const int totalRows = 15;
const double mockupWidth = 360;
const double mockupHeight = 640;

///Extensão para suportar configuracoes de responsividade da aplicação
extension ThemeDataExtension on ThemeData {
  double get columnSize => (100 / totalColumns).w;
  double get rowSize => (100 / totalRows).h;
  double get maxWidth => 100.w;
  double get maxHeight => 100.h;
}

extension SizerExt on num {
  ///s = scale (aumentar/diminuir proporcionalmente a largura da tela aplicando o fator de proporcao quando o dispositivo for tablet)
  double get s => this * fator(0).clamp(1, 20);

  double get s1 => this * fator(1).clamp(1, 20);

  double get s2 => this * fator(2).clamp(1, 20);

  double get s3 => this * fator(3).clamp(1, 20);
  
  double get s4 => this * fator(4).clamp(1, 20);

  double get s5 => this * fator(5).clamp(1, 20);

  double get s6 => this * fator(6).clamp(1, 20);

  double get s7 => this * fator(7).clamp(1, 20);

  ///r = resize (aumentar/diminuir proporcionalmente a largura da tela)
  double get r => this * (isPortrait ? Device.width / mockupWidth : Device.height / mockupHeight).clamp(1, 20);
}

///Método para retornar o dispositivo usado pelo usuario
ScreenType get device {
  final double screenSize = isPortrait ? Device.width : Device.height;
  if (Platform.isAndroid || Platform.isIOS) {
    return screenSize < 430 ? ScreenType.mobile : ScreenType.tablet;
  }
  return Device.screenType;
}

///Método para calcular o fator de multiplicacao utilizado na escala
double fator(int multiplicador) {
  const int limiteBase = 500;
  double limite = limiteBase + (limiteBase * 0.1 * multiplicador);

  if (device == ScreenType.tablet) {
    double screenLimit = isPortrait ? Device.width : Device.height;
    return (screenLimit <= limite ? screenLimit : limite) / mockupWidth;
  }

  return ((isPortrait ? Device.width : Device.height) / mockupWidth);
}

///Retorna o Cross Axis para um SliverGridDelegateWithFixedCrossAxisCount, baseado na orientation
int getCrossAxisCount(context) => isMobile ? MediaQuery.orientationOf(context) == Orientation.landscape ? 4 : 3 : 4;

///Propriedade para obter o tamanho personalizado da appbar
double get appBarSizeLandscape => isMobile ? 2.5 : 2;

///Como estamos em modo paisagem (landscape), a largura se torna a altura, então a validação é baseada
///na altura quando o dispositivo está deitado. Geralmente, tablets têm uma altura maior que 400.
bool get isMobile => device == ScreenType.mobile;

///Verifica se o dispositivo é pequeno
bool get isSmallerDevices {
  final double screenSize = isPortrait ? Device.width : Device.height;
  return screenSize <= 340;
}

bool get isPortrait => Device.orientation == Orientation.portrait;
