import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import "package:flutter/material.dart";

class BaseButton extends StatelessWidget {
  final Widget child;
  final Color backGroundColor;
  final Function()? onTap;
  final ContainerWidth? width;

  const BaseButton({
    Key? key,
    this.onTap,
    this.width,
    required this.child,
    required this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return LayoutContainer(
          height: 40.0,
          child: Container(
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
          ),
        );
      },
    );
  }
}