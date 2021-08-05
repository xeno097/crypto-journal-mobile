import "package:flutter/material.dart";

enum ContainerWidth {
  Full,
  Half,
  Small,
}

class LayoutContainer extends StatelessWidget {
  final Widget child;
  final ContainerWidth? width;
  final double? height;

  const LayoutContainer({
    Key? key,
    this.width,
    this.height,
    required this.child,
  }) : super(key: key);

  double _getButtonWidth(double maxWidth, ContainerWidth? width) {
    switch (width) {
      case ContainerWidth.Full:
        return maxWidth;
      case ContainerWidth.Half:
        return maxWidth / 2;
      case ContainerWidth.Small:
        return maxWidth / 4;
      default:
        return maxWidth / 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: this.height ?? constraints.maxHeight,
          width: this._getButtonWidth(
            constraints.maxWidth,
            this.width,
          ),
          child: this.child,
        );
      },
    );
  }
}
