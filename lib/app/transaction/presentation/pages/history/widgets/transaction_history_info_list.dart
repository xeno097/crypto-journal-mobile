import 'package:crypto_journal_mobile/app/transaction/presentation/pages/history/widgets/transaction_info_list_tile.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/providers/transaction_history_state.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/providers/transaction_history_state_notifier.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_list_element_padding.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/last_list_element.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/placeholder/error_placeholder.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionHistoryInfoList extends StatefulWidget {
  const TransactionHistoryInfoList({
    Key? key,
  }) : super(key: key);

  @override
  _TransactionHistoryInfoListState createState() =>
      _TransactionHistoryInfoListState();
}

class _TransactionHistoryInfoListState
    extends State<TransactionHistoryInfoList> {
  double _oldMaxScrollHeight = 0;
  final _controller = ScrollController();

  void _fetchMore() {
    final maxScrollHeight = _controller.position.maxScrollExtent;

    final currScrollHeigth = _controller.position.pixels;

    if (currScrollHeigth > _oldMaxScrollHeight &&
        currScrollHeigth == maxScrollHeight) {
      _oldMaxScrollHeight = _controller.position.maxScrollExtent;
      context
          .read(
            transactionHistoryStateNotifierProvider.notifier,
          )
          .fetchMore();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => this._fetchMore());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(transactionHistoryStateNotifierProvider);
        final transactions = state.transactions;
        final transactionsLen = transactions.length;

        if (state is InitialTransactionHistoryState) {
          return DefaultCircularProgressIndicator();
        }

        return ListView.builder(
          controller: _controller,
          itemCount: transactionsLen + 1,
          itemBuilder: (context, index) {
            if (index == transactionsLen) {
              if (state is LoadedTransactionHistoryState) {
                return LastListElement();
              }

              if (state is LoadingTransactionHistoryState) {
                return Column(
                  children: [
                    DefaultCircularProgressIndicator(),
                    LastListElement(),
                  ],
                );
              }

              return Column(
                children: [
                  ErrorPlaceholder(),
                  LastListElement(),
                ],
              );
            }

            final transaction = transactions[index];

            return DefaultListElementPadding(
              key: Key(transaction.id),
              child: TransactionInfoListTile(
                transactionDto: transaction,
              ),
            );
          },
        );
      },
    );
  }
}
