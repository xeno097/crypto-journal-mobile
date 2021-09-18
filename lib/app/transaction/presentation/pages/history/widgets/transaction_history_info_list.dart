import 'package:crypto_journal_mobile/app/transaction/presentation/pages/history/widgets/transaction_info_list_tile.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/providers/transaction_history_state.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/providers/transaction_history_state_notifier.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/transaction_dto.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_list_element_padding.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/last_list_element.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/placeholder/error_placeholder.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionHistoryInfoList extends StatefulWidget {
  const TransactionHistoryInfoList({Key? key}) : super(key: key);

  @override
  _TransactionHistoryInfoListState createState() =>
      _TransactionHistoryInfoListState();
}

class _TransactionHistoryInfoListState
    extends State<TransactionHistoryInfoList> {
  double oldMaxHeight = 0;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final height = _controller.position.maxScrollExtent;

      final currPos = _controller.position.pixels;

      if (currPos > oldMaxHeight && currPos == height) {
        print("Fectching more");
        oldMaxHeight = _controller.position.maxScrollExtent;
        context
            .read(transactionHistoryStateNotifierProvider.notifier)
            .fetchMore();
      }
    });
  }

  List<Widget> _buildTransactionHistoryList(List<TransactionDto> holdings) {
    print(holdings.length);

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
    return SingleChildScrollView(
      controller: _controller,
      child: Consumer(
        builder: (context, watch, child) {
          final state = watch(transactionHistoryStateNotifierProvider);

          if (state is LoadingTransactionHistoryState) {
            return Container(
              child: Column(
                children: [
                  ...this._buildTransactionHistoryList(
                    state.transactions,
                  ),
                  DefaultCircularProgressIndicator(),
                  LastListElement(),
                ],
              ),
            );
          }

          if (state is LoadedTransactionHistoryState) {
            return Container(
              child: Column(
                children: [
                  ...this._buildTransactionHistoryList(
                    state.transactions,
                  ),
                  LastListElement(),
                ],
              ),
            );
          }

          return Container(
            child: Column(
              children: [
                ...this._buildTransactionHistoryList(
                  state.transactions,
                ),
                ErrorPlaceholder(),
                LastListElement(),
              ],
            ),
          );
        },
      ),
    );
  }
}
