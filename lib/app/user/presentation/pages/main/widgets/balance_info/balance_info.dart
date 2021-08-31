import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class BalanceInfo extends StatelessWidget {
  final BalanceDto balanceDto;

  const BalanceInfo({
    Key? key,
    required this.balanceDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final currHeight = constraints.maxHeight;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: defaultPadding,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "Current balance",
                style: defaultTextStyle.copyWith(
                  fontSize:
                      currHeight * primaryTextStyleSize / balanceCardHeight,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: defaultPadding,
              ),
              child: Text(
                "\$ ${this.balanceDto.balance.toStringAsFixed(
                      decimalDigits,
                    )}",
                style: boldMainTitleTextStyle.copyWith(
                  fontSize:
                      currHeight * mainTitleTextStyleSize / balanceCardHeight,
                ),
              ),
            ),
            Text(
              "${this.balanceDto.cryptoValue.toStringAsFixed(
                    decimalDigits,
                  )} ${this.balanceDto.cryptoCurrency}",
              style: defaultTextStyleSecondary.copyWith(
                fontSize:
                    currHeight * subTitleTextStyleSize / balanceCardHeight,
              ),
            ),
          ],
        );
      },
    );
  }
}
