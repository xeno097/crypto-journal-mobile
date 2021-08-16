import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/create_transaction_form_field.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/create_transaction_form_info_tab.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/providers/create_transaction_provider.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/create_transaction_dto.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_drop_down_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/inputs/date_picker_input.dart';
import 'package:crypto_journal_mobile/shared/widgets/inputs/base_text_box_input.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CreateTransactionForm extends StatefulWidget {
  final List<OperationDto> operationOptions;
  final List<String> currencyOptions;

  const CreateTransactionForm({
    Key? key,
    required this.currencyOptions,
    required this.operationOptions,
  }) : super(key: key);

  @override
  _CreateTransactionFormState createState() => _CreateTransactionFormState();
}

class _CreateTransactionFormState extends State<CreateTransactionForm> {
  double coinNumber = 0;
  String currency = "";
  double coinPrice = 0;
  double fees = 0;
  DateTime _transactionDate = DateTime.now();
  String _subTotal = "0";
  String total = "0";
  String selectedOperation = "";

  void _setCoinNumber(double value) {
    this.coinNumber = value;

    this._setInfo();
  }

  void _setCurrency(String value) {
    this.currency = value;
  }

  void _setCoinPrice(double value) {
    this.coinPrice = value;

    this._setInfo();
  }

  void _setFees(double value) {
    this.fees = value;

    this._setInfo();
  }

  void _setInfo() {
    final double coins = this.coinNumber;
    final double price = this.coinPrice;
    final double fees = this.fees;

    final double subTotal = (coins * price);

    if (subTotal != 0) {
      setState(() {
        this._subTotal = subTotal.toStringAsFixed(2);
        this.total = (subTotal + fees).toStringAsFixed(2);
      });
    }
  }

  // TO KEEP
  List<String> _supportedCurrencies = [];
  List<OperationDto> _operationOptions = [];

  @override
  void initState() {
    super.initState();
    this._supportedCurrencies = this.widget.currencyOptions;
    this._operationOptions = this.widget.operationOptions;

    if (this._operationOptions.length != 0) {
      this.selectedOperation = this._operationOptions[0].id;
    }

    if (this._supportedCurrencies.length != 0) {
      this.currency = this._supportedCurrencies[0];
    }
  }

  List<DropdownMenuItem<String>> _formatCurrencies() {
    return this
        ._supportedCurrencies
        .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: defaultTextStyle,
            )))
        .toList();
  }

  List<DropdownMenuItem<String>> _formatOperationTypes() {
    return this
        ._operationOptions
        .map((e) => DropdownMenuItem(
            value: e.id,
            child: Text(
              e.name,
              style: defaultTextStyle,
            )))
        .toList();
  }

  void _setOperation(String val) {
    this.selectedOperation = val;
  }

  void _setDate(DateTime date) {
    this._transactionDate = date;
  }

  void _createTransaction(BuildContext context) async {
    final createTransactionDto = CreateTransactionDto(
      coinSymbol: this.currency,
      coins: this.coinNumber,
      fee: this.fees,
      coinPrice: this.coinPrice,
      date: this._transactionDate.toIso8601String(),
      operation: this.selectedOperation,
    );

    final res = await context
        .read(createTransactionProvider(createTransactionDto).future);

    print(res);
    if (res != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.route, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CreateTransactionFormTab(
                  fieldName: "Coins",
                  primaryInput: Center(
                    child: BaseTextBoxInput(
                      hint: "1",
                      onChanged: this._setCoinNumber,
                    ),
                  ),
                  secondaryInput: Center(
                    child: BaseDropDownButton(
                      items: this._formatCurrencies(),
                      onChanged: this._setCurrency,
                    ),
                  ),
                ),
                CreateTransactionFormTab(
                  fieldName: "Price",
                  primaryInput: Center(
                    child: BaseTextBoxInput(
                      hint: "0",
                      onChanged: this._setCoinPrice,
                    ),
                  ),
                  secondaryInput: Center(
                    child: Text(
                      "USD",
                      style: defaultTextStyle,
                    ),
                  ),
                ),
                CreateTransactionFormTab(
                  fieldName: "Fees",
                  primaryInput: Center(
                    child: BaseTextBoxInput(
                      hint: "0",
                      onChanged: this._setFees,
                    ),
                  ),
                  secondaryInput: Center(
                    child: Text(
                      "USD",
                      style: defaultTextStyle,
                    ),
                  ),
                ),
                CreateTransactionFormTab(
                  fieldName: "Date",
                  primaryInput: Center(
                    child: DatePickerInput(
                      onChanged: this._setDate,
                    ),
                  ),
                ),
                CreateTransactionFormTab(
                  fieldName: "Type",
                  primaryInput: Container(
                    child: Center(
                      child: BaseDropDownButton(
                        items: this._formatOperationTypes(),
                        onChanged: this._setOperation,
                      ),
                    ),
                  ),
                ),
                CreateTransactionFormInfoTab(
                  fieldName: "Sub-total",
                  value: "\$${this._subTotal}",
                  unit: "USD",
                ),
                CreateTransactionFormInfoTab(
                  fieldName: "Total",
                  value: "\$${this.total}",
                  unit: "USD",
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 21.0),
              child: BaseButton(
                child: Center(
                  child: Text(
                    "Create Transaction",
                    style: defaultTextStyle,
                  ),
                ),
                backGroundColor: googleButtonBackGroundColor,
                onTap: () async => this._createTransaction(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
