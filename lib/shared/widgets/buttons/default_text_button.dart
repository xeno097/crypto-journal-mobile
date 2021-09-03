import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import "package:flutter/material.dart";

enum ButtonWidth {
  Full,
  Medium,
  Half,
  Small,
}

class DefaultTextButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final ButtonWidth width;
  final TextStyle? textStyle;
  final Color? color;

  const DefaultTextButton({
    Key? key,
    this.onTap,
    this.textStyle,
    this.color,
    this.width = ButtonWidth.Half,
    required this.text,
  }) : super(key: key);

  TextStyle _textStyleBuilder(double height) {
    final style = this.textStyle ?? defaultTextStyle;

    return style.copyWith(
      fontSize: height * primaryTextStyleSize / defaultHeight,
    );
  }

  BoxDecoration _boxDecorationBuilder() {
    final decoration = this.color == null
        ? defaultContainerDecoration
        : defaultContainerDecoration.copyWith(
            color: this.color,
          );

    return decoration;
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

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      heigthProp: buttonHeight,
      builder: (BuildContext context, Size size) {
        final height = size.height;

        return Align(
          child: GestureDetector(
            onTap: this.onTap ?? () {},
            child: Container(
              alignment: Alignment.center,
              width: this._buttonWidthBuilder(size.width),
              child: Center(
                child: Text(
                  this.text,
                  style: this._textStyleBuilder(
                    height,
                  ),
                ),
              ),
              decoration: this._boxDecorationBuilder(),
            ),
          ),
        );
      },
    );
  }
}
