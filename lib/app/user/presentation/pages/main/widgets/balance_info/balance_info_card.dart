import 'package:crypto_journal_mobile/app/balance/presentation/providers/get_balance_state.dart';
import 'package:crypto_journal_mobile/app/balance/presentation/providers/get_balance_state_notifier.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/balance_info/balance_info.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/placeholder/error_placeholder.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceInfoCard extends StatelessWidget {
  const BalanceInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: defaultWidth / balanceCardHeight,
      child: DefaultContainer(
        paddingType: PaddingType.All,
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(getBalanceStateNotifierProvider);

            if (state is InitialGetBalanceState ||
                state is LoadingGetBalanceState) {
              return DefaultCircularProgressIndicator();
            }

            if (state is LoadedGetBalanceState) {
              return BalanceInfo(
                balanceDto: state.balance,
              );
            }

            return ErrorPlaceholder();
          },
        ),
      ),
    );
  }
}
