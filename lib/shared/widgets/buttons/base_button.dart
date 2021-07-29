import "package:flutter/material.dart";

class BaseButton extends StatelessWidget {
  final Widget child;
  final Color backGroundColor;
  final Function()? onTap;

  const BaseButton({
    Key? key,
    this.onTap,
    required this.child,
    required this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 40.0,
          width: constraints.maxWidth / 2,
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
