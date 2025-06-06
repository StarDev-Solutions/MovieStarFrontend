import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class UIText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final TextAlign? textAlign; 

  UIText.tituloMedia(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = tituloMediaStyle;
  UIText.label(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = labelStyle;
  UIText.label2(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = labelStyle2;
  UIText.labelTextField(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = labelTextFieldStyle;
  UIText.labelUsuarios(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = labelUsuarios;
  
  UIText.categoryLabel(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = categoryLabelStyle;
  UIText.quantityTitlesLabel(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = quantityTitlesLabelStyle;

  UIText.sinopse(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = sinopseStyle;
  UIText.dataLancamento(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = dataLancamentoStyle;
  
  UIText.nomeAtor(this.text, {super.key, this.textOverflow, this.maxLines = 1, this.textAlign = TextAlign.start}) : style = nomeAtorStyle;
  UIText.nomePersonagem(this.text, {super.key, this.textOverflow, this.maxLines = 1, this.textAlign = TextAlign.start}) : style = nomePersonagemStyle;
  

  UIText.contentTitle(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = contentTitleStyle;

  UIText.excerpt(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = excerptStyle;
  UIText.primaryButtonStyle(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = primaryButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 2,
    );
  }
}
