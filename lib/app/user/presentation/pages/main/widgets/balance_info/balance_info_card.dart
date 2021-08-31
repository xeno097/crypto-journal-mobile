import 'package:crypto_journal_mobile/app/balance/presentation/providers/get_balance_provider.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/balance_info/balance_info.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
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
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(defaultContainerPadding),
          child: Consumer(
            builder: (BuildContext context, watch, child) {
              final request = watch(getBalanceProvider);

              return request.when(
                data: (balance) => BalanceInfo(
                  balanceDto: balance,
                ),
                loading: () => DefaultCircularProgressIndicator(),
                error: (err, _) => Text("An error occured"),
              );
            },
          ),
        ),
        decoration: defaultContainerDecoration,
      ),
    );
  }
}
