import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/header/main_page_header.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/holding_info/holding_info_list_tile.dart';
import "package:flutter/material.dart";

class HoldingInfoList extends StatelessWidget {
  final HoldingDto holdingDto = HoldingDto(
    holding: 0.55670,
    id: "BTC",
    name: "Bitcoin",
    price: 48000.97,
    symbol: "BTC",
    value: 567.96,
  );

  HoldingInfoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageHeader(
          title: "Holding",
        ),
        HoldingInfoListTile(
          holdingDto: holdingDto,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: HoldingInfoListTile(
            holdingDto: holdingDto,
          ),
        ),
      ],
    );
  }
}
