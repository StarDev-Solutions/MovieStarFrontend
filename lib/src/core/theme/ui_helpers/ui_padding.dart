import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';
import 'package:sizer/sizer.dart';

///Cria um padding para o widget, seguindo a regra do aplicativo
class UIPadding extends StatelessWidget {
  final Widget? child;
  final bool useHorizontalPadding;
  final bool useVerticalPadding;

  const UIPadding({
    super.key,
    required this.child,
    this.useHorizontalPadding = false, 
    this.useVerticalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: useHorizontalPadding ? (Device.orientation == Orientation.portrait ? Theme.of(context).columnSize : Theme.of(context).columnSize * 1.5) : 0,
        vertical: useVerticalPadding ? Theme.of(context).rowSize * 1.2 : 0,
      ),
      child: child,
    );
  }
}

///Método que disponibiliza um padding para o axis horizontal
EdgeInsets getPaddingHorizontal(BuildContext context) => EdgeInsets.symmetric(horizontal: (Device.orientation == Orientation.portrait ? Theme.of(context).columnSize : Theme.of(context).columnSize * 1.5));

///Cria um padding para o sliver, seguindo a regra do aplicativo
class UIPaddingSliver extends SliverPadding {
  final BuildContext context;

  @override
  UIPaddingSliver(this.context, {
    super.key,
    required Widget super.sliver,
    required bool useHorizontalPadding,
    required bool useVerticalPadding,
  }) : super(
          padding: EdgeInsets.symmetric(
            horizontal: useHorizontalPadding ? (Device.orientation == Orientation.portrait ? Theme.of(context).columnSize * 0.5 : Theme.of(context).columnSize * 1.5) : 0,
            vertical: useVerticalPadding ? Theme.of(context).rowSize * 0.3 : 0,
          ),
        );
}
