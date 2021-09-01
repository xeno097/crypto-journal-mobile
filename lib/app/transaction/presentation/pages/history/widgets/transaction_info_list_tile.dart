import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_tile_widget.dart';
import "package:flutter/material.dart";

class TransactionInfoListTile extends StatelessWidget {
  final TransactionDto transactionDto;

  const TransactionInfoListTile({
    Key? key,
    required this.transactionDto,
  }) : super(key: key);

  Text _coinsNumberTextFormatter(double containerHeigth) {
    final isSell = this.transactionDto.operation.type == OperationType.BUY;
    final operationSign = isSell ? "+" : "-";
    final textStyle =
        isSell ? defaultTextStyleStonks : defaultTextStyleNotStonks;

    return Text(
      "$operationSign${this.transactionDto.coins.toStringAsFixed(
            decimalDigits,
          )}",
      style: textStyle.copyWith(
        fontSize: containerHeigth * (secondaryTextStyleSize / defaultHeight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, height) {
        final padding = height * (defaultContainerPadding / defaultHeight);
        final iconSize = height - 2 * padding;

        return BaseTileWidget(
          padding: padding,
          leading: Row(
            children: [
              Icon(
                Icons.monetization_on_outlined,
                size: iconSize,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultRowItemPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.transactionDto.coinSymbol,
                      style: subTitleTextStyle.copyWith(
                        fontSize:
                            height * (subTitleTextStyleSize / defaultHeight),
                      ),
                    ),
                    Text(
                      this.transactionDto.operation.name,
                      style: defaultTextStyle.copyWith(
                        fontSize:
                            height * (secondaryTextStyleSize / defaultHeight),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${this.transactionDto.cost.toStringAsFixed(
                      decimalDigits,
                    )}",
                style: defaultTextStyle.copyWith(
                  fontSize: height * (primaryTextStyleSize / defaultHeight),
                ),
              ),
              this._coinsNumberTextFormatter(height),
            ],
          ),
        );
      },
    );
  }
}
