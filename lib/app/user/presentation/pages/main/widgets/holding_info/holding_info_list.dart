import 'package:crypto_journal_mobile/app/holding/presentation/providers/get_holdings_provider.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/section_header.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/holding_info/holding_info_list_tile.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/placeholder/error_placeholder.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HoldingInfoList extends StatelessWidget {
  const HoldingInfoList({
    Key? key,
  }) : super(key: key);

  List<Widget> _buildHoldingList(List<HoldingDto> holdings) {
    List<Widget> ret = holdings
        .map(
          (holding) => Padding(
            padding: const EdgeInsets.only(
              bottom: defaultListElementPadding,
            ),
            child: HoldingInfoListTile(
              holdingDto: holding,
            ),
          ),
        )
        .toList();

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Holding",
          titleStyle: TitleStyle.Secondary,
        ),
        Consumer(
          builder: (BuildContext context, watch, child) {
            final request = watch(getHoldingsProvider);

            return request.when(
              data: (holdings) => Column(
                children: this._buildHoldingList(
                  holdings,
                ),
              ),
              loading: () => DefaultCircularProgressIndicator(),
              error: (err, _) => ErrorPlaceholder(),
            );
          },
        ),
      ],
    );
  }
}
