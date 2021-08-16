import 'package:crypto_journal_mobile/app/operation/presentation/providers/get_operations_provider.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/create_transaction_form.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/home/widgets/tab_container.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTransactionPage extends StatelessWidget {
  static final route = "/create-transaction";

  final currencyOptions = [
    "BTC",
    "USDT",
    "ETH",
    "ADA",
    "SOL",
    "VET",
    "MATIC",
    "SHIB",
  ];

  CreateTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("TransactionPage");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backGroundColorPrimary,
      body: SafeArea(
        child: TabContainer(
          header: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Create Transaction",
              style: pageTitleTextStyle,
            ),
          ),
          body: Consumer(
            builder: (context, watch, child) {
              final res = watch(getOperationsProvider);

              return res.map(
                data: (data) => CreateTransactionForm(
                  currencyOptions: currencyOptions,
                  operationOptions: data.value,
                ),
                loading: (_) => Center(
                  child: CircularProgressIndicator(),
                ),
                error: (err) => Text("Error? "),
              );
            },
          ),
        ),
      ),
    );
  }
}
