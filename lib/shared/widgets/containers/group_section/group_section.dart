import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_list_element_padding.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/group_section/group_section_tile.dart';
import "package:flutter/material.dart";

class GroupedSection extends StatelessWidget {
  final String title;
  final List<GroupSectionTile> children;

  const GroupedSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultListElementPadding(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: defaultRowItemPadding,
            ),
            child: BaseLayoutContainer(
              heigthProp: subTitleHeight,
              builder: (context, heigth) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.title,
                    style: defaultTextStyle.copyWith(
                      fontSize: heigth * subTitleTextStyleSize / subTitleHeight,
                    ),
                  ),
                );
              },
            ),
          ),
          BaseLayoutContainer(
            heigthProp: this.children.length * defaultHeight,
            child: DefaultContainer(
              child: Column(
                children: this.children,
              ),
            ),
          )
        ],
      ),
    );
  }
}
