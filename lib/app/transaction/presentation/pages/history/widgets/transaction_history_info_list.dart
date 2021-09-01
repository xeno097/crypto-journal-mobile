import 'package:crypto_journal_mobile/app/transaction/presentation/pages/history/widgets/transaction_info_list_tile.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/providers/get_transactions_provider.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_list_element_padding.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionHistoryInfoList extends StatelessWidget {
  const TransactionHistoryInfoList({Key? key}) : super(key: key);

  List<Widget> _buildTransactionHistoryList(List<TransactionDto> holdings) {
    List<Widget> ret = holdings
        .map(
          (holding) => DefaultListElementPadding(
            child: TransactionInfoListTile(
              transactionDto: holding,
            ),
          ),
        )
        .toList();

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final userDto = watch(getTransactionsProvider);

        return userDto.when(
          data: (data) => Container(
            child: Column(
              children: this._buildTransactionHistoryList(data),
            ),
          ),
          loading: () => DefaultCircularProgressIndicator(),
          error: (err, _) => Text("Error? "),
        );
      },
    );
  }
}
