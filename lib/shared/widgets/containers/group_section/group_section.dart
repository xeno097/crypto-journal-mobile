import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_list_element_padding.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/group_section/group_section_tile.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/sub_section_header.dart';
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
          SubSectionHeader(
            subTitle: this.title,
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
