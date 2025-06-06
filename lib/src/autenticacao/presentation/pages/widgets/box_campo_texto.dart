import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviestar/src/base/presentation/pages/widgets/box_icone.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

///Classe responsavel por criar um TextField customizado.
class BoxCampoTexto extends StatefulWidget {
  final BuildContext? context;
  final bool enabled;
  final bool isReadOnly;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final String? label;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String)? onChanged;
  final double? height;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onFieldSubmitted;
  final String? initialValue;
  final VoidCallback? onPressedSuffixIcon;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextCapitalization? textCapitalization;
  final bool isPassword;
  final bool isOnTapClear;
  final bool isObservationField;
  final bool enableButtonCleanValue;
  final FocusNode? focusNode;
  final Function()? onPressed;

  const BoxCampoTexto({
    super.key,
    this.context,
    this.enabled = true,
    this.isReadOnly = false,
    this.autofocus = false,
    this.autovalidateMode,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.height,
    this.contentPadding,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.initialValue,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textCapitalization,
    this.isPassword = false,
    this.isOnTapClear = false,
    this.isObservationField = false,
    this.enableButtonCleanValue = false,
    this.focusNode,
    this.onPressed,
    this.onPressedSuffixIcon,
  });
  
  @override
  State<BoxCampoTexto> createState() => _BoxCampoTextoState();
}

class _BoxCampoTextoState extends State<BoxCampoTexto> {
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        onTap: widget.onPressed,
        autovalidateMode: widget.autovalidateMode,
        enabled: widget.enabled,
        readOnly: widget.isReadOnly,
        autofocus: widget.autofocus,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        initialValue: widget.initialValue,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.sentences,
        controller: widget.controller,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        obscureText: _obscureText,
        style: labelTextFieldStyle,
        decoration: InputDecoration(
          label: UIText.labelTextField(widget.label ?? '', maxLines: 3),
          counterText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: widget.prefixIcon != null
              ? BoxIcone(icone: widget.prefixIcon)
              : null,
          prefixIconConstraints: BoxConstraints.tight(Size(60.s2, 25.s2)),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  child: BoxIcone(
                    icone: _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onTap: () => setState(() => _obscureText = !_obscureText),
                )
              : widget.enableButtonCleanValue ? 
              GestureDetector(
                  child: const BoxIcone(
                    icone: Icons.clear,
                  ),
                  onTap: () => widget.controller!.clear(),
                ) :
              GestureDetector(
                  onTap: widget.onPressedSuffixIcon,
                  child: BoxIcone(
                    icone: widget.suffixIcon,
                    cor: colorLabelOnPrimary.withValues(alpha: 0.2),
                  ),
                ),
          suffixIconConstraints: widget.isPassword || widget.enableButtonCleanValue || widget.suffixIcon != null ? BoxConstraints.tight(Size(60.s2, 25.s2)) : BoxConstraints.tight(const Size(20, 0)),
          filled: true,
          hintStyle: excerptStyle,
          hintText: widget.hintText,
          contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 10.s, vertical: 17.s),
        ),
      ),
    );
  }
}