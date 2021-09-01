import 'package:crypto_journal_mobile/app/transaction/presentation/pages/history/widgets/transaction_history_info_list.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/history/widgets/transaction_history_page_header.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_page_container.dart';
import "package:flutter/material.dart";

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HistoryPage");

    return DefaultPageContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TransactionHistoryPageHeader(),
            TransactionHistoryInfoList(),
          ],
        ),
      ),
    );
  }
}
