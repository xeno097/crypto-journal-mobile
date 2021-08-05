import 'package:crypto_journal_mobile/shared/theme/shadows.dart';
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
    return GestureDetector(
      onTap: this.onTap ?? () {},
      child: LayoutContainer(
        height: 40.0,
        width: this.width,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: defaultElementShadow,
            color: this.backGroundColor,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: this.child,
        ),
      ),
    );
  }
}
