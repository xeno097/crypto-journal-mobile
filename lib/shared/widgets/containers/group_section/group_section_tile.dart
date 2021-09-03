import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import "package:flutter/material.dart";

class GroupSectionTile extends StatelessWidget {
  final String label;
  final void Function()? onTap;

  const GroupSectionTile({
    Key? key,
    this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, size) {
        final height = size.height;

        return Container(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: this.onTap ?? () {},
            child: Text(
              this.label,
              style: defaultTextStyle.copyWith(
                fontSize: height * primaryTextStyleSize / defaultHeight,
              ),
            ),
          ),
        );
      },
    );
  }
}
