import 'package:crypto_journal_mobile/app/operation/presentation/providers/get_operations_provider.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/create_transaction_form/create_transaction_form.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/header/create_transaction_page_header.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/create_transaction_form/create_transaction_price_info_header.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/providers/create_transaction_provider.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_text_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_page_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/scaffold/default_scaffold.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTransactionPage extends StatefulWidget {
  static final route = "/create-transaction";

  const CreateTransactionPage({Key? key}) : super(key: key);

  @override
  _CreateTransactionPageState createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  double _total = 0;
  double _subTotal = 0;
  double _fees = 0;
  double _coinAmount = 0;
  double _coinPrice = 0;
  DateTime _date = DateTime.now();
  String _operation = "";
  String _cryptoCurrency = "";

  void _setOperation(String operation) {
    this._operation = operation;
  }

  void _setCryptoCurrency(String value) {
    this._cryptoCurrency = value;
  }

  void _setDate(DateTime date) {
    this._date = date;
  }

  void _setTotal() {
    setState(() {
      this._subTotal = this._coinAmount * this._coinPrice;
      this._total = this._subTotal + this._fees;
    });
  }

  void _setCoinAmount(String value) {
    final convertedValue = double.tryParse(value);

    if (convertedValue != null) {
      this._coinAmount = convertedValue;
      this._setTotal();
    }
  }

  void _setCoinPrice(String value) {
    final convertedValue = double.tryParse(value);

    if (convertedValue != null) {
      this._coinPrice = convertedValue;
      this._setTotal();
    }
  }

  void _setFees(String value) {
    final convertedValue = double.tryParse(value);

    if (convertedValue != null) {
      this._fees = convertedValue;
      this._setTotal();
    }
  }

  void _createTransaction() async {
    CreateTransactionDto createTransactionDto = CreateTransactionDto(
      coinSymbol: this._cryptoCurrency,
      coins: this._coinAmount,
      fee: this._fees,
      coinPrice: this._coinPrice,
      date: this._date.toIso8601String(),
      operation: this._operation,
    );

    final res = await context
        .read(createTransactionProvider(createTransactionDto).future);

    if (res == CreateTransactionResult.CreatedTransaction) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.route, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("TransactionPage");

    return DefaultScaffold(
      isListener: false,
      child: DefaultPageContainer(
        child: Column(
          children: [
            CreateTransactionPageHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Consumer(
                  builder: (context, watch, child) {
                    final request = watch(getOperationsProvider);

                    return request.when(
                      data: (value) {
                        return Column(
                          children: [
                            CreateTransactionPriceInfoHeader(
                              total: this._total,
                              fees: this._fees,
                            ),
                            CreateTransactionForm(
                              operationOptions: value,
                              setFees: this._setFees,
                              setOperation: this._setOperation,
                              setCoinPrice: this._setCoinPrice,
                              setCoinAmount: this._setCoinAmount,
                              setDate: this._setDate,
                              setCryptoCurrency: this._setCryptoCurrency,
                            ),
                            SizedBox(
                              height: defaultPagePadding,
                            ),
                            DefaultTextButton(
                              text: "Done",
                              width: ButtonWidth.Half,
                              color: backGroundColorSecondary,
                              onTap: this._createTransaction,
                            )
                          ],
                        );
                      },
                      loading: () => DefaultCircularProgressIndicator(),
                      error: (error, _) {
                        return Text("Error?");
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
