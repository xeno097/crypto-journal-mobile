import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/search_crypto_currency/search_crypto_currency_pop_up.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_drop_down_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import "package:flutter/material.dart";

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
