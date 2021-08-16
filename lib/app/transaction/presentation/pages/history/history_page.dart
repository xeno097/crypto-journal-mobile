import 'package:crypto_journal_mobile/app/transaction/presentation/pages/history/widgets/transaction_history_list_tab.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/history/widgets/transaction_history_page_header.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/providers/get_transactions_provider.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/home/widgets/tab_container.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HistoryPage");

    return TabContainer(
      header: TransactionHistoryPageHeader(),
      body: Consumer(
        builder: (context, watch, child) {
          final userDto = watch(getTransactionsProvider);

          return userDto.map(
            data: (data) => Container(
              child: Center(
                child: ListView.builder(
                  itemCount: data.value.length,
                  itemBuilder: (
                    context,
                    index,
                  ) =>
                      TransactionHistoryListTab(
                    transaction: data.value[index],
                  ),
                ),
              ),
            ),
            loading: (_) => Center(
              child: CircularProgressIndicator(),
            ),
            error: (err) => Text("Error? "),
          );
        },
      ),
    );
  }
}
