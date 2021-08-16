import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_row_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import "package:flutter/material.dart";

class CreateTransactionFormTab extends StatelessWidget {
  final String fieldName;
  final Widget primaryInput;
  final Widget? secondaryInput;

  const CreateTransactionFormTab({
    Key? key,
    this.secondaryInput,
    required this.fieldName,
    required this.primaryInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: BaseButton(
        width: ContainerWidth.Full,
        backGroundColor: backGroundColorSecondary,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BaseRow(
            label: fieldName,
            last: secondaryInput,
            middle: primaryInput,
          ),
        ),
      ),
    );
  }
}
