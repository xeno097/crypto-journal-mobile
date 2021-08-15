import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/create_transaction_page.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class TransactionHistoryPageHeader extends StatelessWidget {
  const TransactionHistoryPageHeader({
    Key? key,
  }) : super(key: key);

  void _createTransaction(BuildContext context) {
    Navigator.pushNamed(
      context,
      CreateTransactionPage.route,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Transaction History",
              style: pageTitleTextStyle,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => this._createTransaction(context),
          child: Icon(
            Icons.add_circle_outline_rounded,
            color: textColorPrimary,
          ),
        ),
      ],
    );
  }
}
