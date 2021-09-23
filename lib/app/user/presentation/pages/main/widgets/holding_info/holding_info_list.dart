import 'package:crypto_journal_mobile/app/holding/presentation/providers/holdings_state.dart';
import 'package:crypto_journal_mobile/app/holding/presentation/providers/holdings_state_notifier.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/holding_info/holding_info_list_tile.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_list_element_padding.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/last_list_element.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/section_header.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/placeholder/error_placeholder.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HoldingInfoList extends StatelessWidget {
  const HoldingInfoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Holding",
          titleStyle: TitleStyle.Secondary,
        ),
        Expanded(
          child: Consumer(
            builder: (BuildContext context, watch, child) {
              final state = watch(holdingsStateNotifierProvider);

              if (state is InitialHoldingsState ||
                  state is LoadingHoldingsState) {
                return DefaultCircularProgressIndicator();
              }

              if (state is LoadedHoldingsState) {
                final holdings = state.holdings;
                final holdingsLen = holdings.length;

                return ListView.builder(
                  itemCount: holdingsLen + 1,
                  itemBuilder: (context, index) {
                    if (index == holdingsLen) {
                      return LastListElement();
                    }

                    return DefaultListElementPadding(
                      child: HoldingInfoListTile(
                        holdingDto: holdings[index],
                      ),
                    );
                  },
                );
              }

              return ErrorPlaceholder();
            },
          ),
        ),
      ],
    );
  }
}
