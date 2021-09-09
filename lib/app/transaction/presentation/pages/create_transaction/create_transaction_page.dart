import 'package:crypto_journal_mobile/app/operation/presentation/providers/get_operations_provider.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/create_transaction_page_header.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/create_transaction_price_info_header.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/search_crypto_currency/search_crypto_currency_pop_up.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_drop_down_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_page_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/sub_section_header.dart';
import 'package:crypto_journal_mobile/shared/widgets/inputs/default_date_picker_input.dart';
import 'package:crypto_journal_mobile/shared/widgets/inputs/default_text_input.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
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
  String? _operation;
  String? _cryptoCurrency;

  void _setOperation(String operation) {
    this._operation = operation;
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

  @override
  Widget build(BuildContext context) {
    print("TransactionPage");

    return Scaffold(
      backgroundColor: backGroundColorPrimary,
      body: DefaultPageContainer(
        child: Column(
          children: [
            CreateTransactionPageHeader(),
            Expanded(
              child: SingleChildScrollView(child: Consumer(
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
                            setCryptoCurrency: (value) {
                              this._cryptoCurrency = value;
                            },
                          ),
                        ],
                      );
                    },
                    loading: () => DefaultCircularProgressIndicator(),
                    error: (error, _) {
                      return Text("Error?");
                    },
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateTransactionForm extends StatelessWidget {
  final void Function(DateTime) setDate;
  final void Function(String value) setFees;
  final void Function(String value) setCoinAmount;
  final void Function(String value) setCoinPrice;
  final void Function(String value) setOperation;
  final void Function(String value) setCryptoCurrency;
  final List<OperationDto> operationOptions;

  const CreateTransactionForm({
    Key? key,
    required this.setDate,
    required this.setFees,
    required this.setCoinPrice,
    required this.setCoinAmount,
    required this.setOperation,
    required this.operationOptions,
    required this.setCryptoCurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubSectionHeader(
          subTitle: "Base info",
        ),
        CreateTransactionSelectSection(
          setOperation: this.setOperation,
          setCryptoCurrency: this.setCryptoCurrency,
          operationOptions: operationOptions,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultListElementPadding,
          ),
          child: DefaultDatePicker(
            onChanged: this.setDate,
          ),
        ),
        SubSectionHeader(
          subTitle: "Price Detail",
        ),
        DefaultTextBoxInput(
          hintText: "Coin Amount",
          textInputType: TextInputType.number,
          onChanged: this.setCoinAmount,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultListElementPadding,
          ),
          child: DefaultTextBoxInput(
            hintText: "Coin Price",
            textInputType: TextInputType.number,
            onChanged: this.setCoinPrice,
          ),
        ),
        DefaultTextBoxInput(
          hintText: "Fees",
          textInputType: TextInputType.number,
          onChanged: this.setFees,
        ),
      ],
    );
  }
}

class CreateTransactionSelectSection extends StatelessWidget {
  const CreateTransactionSelectSection({
    Key? key,
    required this.setOperation,
    required this.operationOptions,
    required this.setCryptoCurrency,
  }) : super(key: key);

  final void Function(String value) setOperation;
  final void Function(String value) setCryptoCurrency;
  final List<OperationDto> operationOptions;

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, size) {
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DefaultDropDownButton(
                  onChanged: this.setOperation,
                  options: this.operationOptions,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: SearchCryptoCurrencyPopUp(
                  hintText: "Crypto Currency",
                  onChanged: this.setCryptoCurrency,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
