import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import "package:flutter/material.dart";

enum ButtonWidth {
  Full,
  Medium,
  Half,
  Small,
}

class BaseButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget Function(BuildContext context, Size size)? builder;
  final Widget? child;
  final ButtonWidth width;
  final Color? color;
  final bool hasDecoration;

  const BaseButton({
    Key? key,
    this.onTap,
    this.color,
    this.width = ButtonWidth.Half,
    this.hasDecoration = true,
    this.child,
    this.builder,
  }) : super(key: key);

  BoxDecoration? _boxDecorationBuilder() {
    final decoration = this.color == null
        ? defaultContainerDecoration
        : defaultContainerDecoration.copyWith(
            color: this.color,
          );

    return this.hasDecoration ? decoration : null;
  }

  double _buttonWidthBuilder(double width) {
    switch (this.width) {
      case ButtonWidth.Full:
        return width;
      case ButtonWidth.Medium:
        return width * 3 / 4;
      case ButtonWidth.Half:
        return width / 2;
      case ButtonWidth.Small:
        return width / 4;
      default:
        return width / 2;
    }
  }

  Widget _build(BuildContext context, Size size) {
    if (this.builder != null) {
      return this.builder!(context, size);
    }

    if (this.child != null) {
      return this.child!;
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      heigthProp: buttonHeight,
      builder: (BuildContext context, Size size) {
        return Align(
          child: GestureDetector(
            onTap: this.onTap ?? () {},
            child: Container(
              alignment: Alignment.center,
              width: this._buttonWidthBuilder(size.width),
              child: this._build(context, size),
              decoration: this._boxDecorationBuilder(),
            ),
          ),
        );
      },
    );
  }
}
