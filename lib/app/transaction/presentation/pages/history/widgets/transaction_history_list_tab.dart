import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import "package:flutter/material.dart";

class TransactionHistoryListTab extends StatelessWidget {
  const TransactionHistoryListTab({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionDto transaction;

  @override
  Widget build(BuildContext context) {
    final isSell = transaction.operation.type == OperationType.BUY;
    final text = "${isSell ? "+" : "-"} ${transaction.coins}";
    final textStyle =
        isSell ? defaultTextStyleStonks : defaultTextStyleNotStonks;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: BaseButton(
        backGroundColor: backGroundColorSecondary,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        transaction.coinSymbol,
                        style: defaultTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "\$${transaction.cost}",
                    style: defaultTextStyle,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
