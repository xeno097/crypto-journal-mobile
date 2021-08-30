import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/balance_info/balance_info.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import "package:flutter/material.dart";

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
          padding: const EdgeInsets.all(defaultPadding),
          child: BalanceInfo(
            balanceDto: BalanceDto(
              balance: 4790.67,
              id: "BTC",
              cryptoCurrency: "BTC",
              cryptoValue: 0.1257,
            ),
          ),
        ),
        decoration: defaultContainerDecoration,
      ),
    );
  }
}
