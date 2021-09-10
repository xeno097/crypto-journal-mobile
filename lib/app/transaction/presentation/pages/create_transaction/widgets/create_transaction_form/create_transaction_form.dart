import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/create_transaction_form/create_transaction_form_select_section.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/sub_section_header.dart';
import 'package:crypto_journal_mobile/shared/widgets/inputs/default_date_picker_input.dart';
import 'package:crypto_journal_mobile/shared/widgets/inputs/default_text_input.dart';
import "package:flutter/material.dart";

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
