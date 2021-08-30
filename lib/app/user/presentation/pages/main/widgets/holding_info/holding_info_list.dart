import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/header/main_page_header.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/holding_info/holding_info_list_tile.dart';
import "package:flutter/material.dart";

class HoldingInfoList extends StatelessWidget {
  const HoldingInfoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageHeader(
          title: "Holding",
        ),
        HoldingInfoListTile(),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: HoldingInfoListTile(),
        ),
      ],
    );
  }
}
