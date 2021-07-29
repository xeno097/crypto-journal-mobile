import "package:flutter/material.dart";

enum BaseButtonWidth {
  Full,
  Half,
  Small,
}

class BaseButton extends StatelessWidget {
  final Widget child;
  final Color backGroundColor;
  final Function()? onTap;
  final BaseButtonWidth? width;

  const BaseButton({
    Key? key,
    this.onTap,
    this.width,
    required this.child,
    required this.backGroundColor,
  }) : super(key: key);

  double _getButtonWidth(double maxWidth, BaseButtonWidth? width) {
    switch (width) {
      case BaseButtonWidth.Full:
        return maxWidth;
      case BaseButtonWidth.Half:
        return maxWidth / 2;
      case BaseButtonWidth.Small:
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
          height: 40.0,
          width: this._getButtonWidth(
            constraints.maxWidth,
            this.width,
          ),
          child: GestureDetector(
            child: this.child,
            onTap: this.onTap ?? () {},
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 2.0,
                blurRadius: 4.0,
                offset: Offset(
                  4.0,
                  4.0,
                ),
              ),
            ],
            color: this.backGroundColor,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        );
      },
    );
  }
}
