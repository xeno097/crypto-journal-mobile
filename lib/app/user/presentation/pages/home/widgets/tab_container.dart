import "package:flutter/material.dart";

class TabContainer extends StatelessWidget {
  final Widget header;
  final Widget body;

  const TabContainer({
    Key? key,
    required this.body,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 21.0,
          right: 21.0,
          top: 10.0,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            this.header,
            Expanded(
              child: this.body,
            )
          ],
        ),
      ),
    );
  }
}
