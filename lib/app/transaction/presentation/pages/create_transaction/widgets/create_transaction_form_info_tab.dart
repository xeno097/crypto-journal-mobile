import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_row_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import "package:flutter/material.dart";

class CreateTransactionFormInfoTab extends StatelessWidget {
  final String fieldName;
  final String value;
  final String unit;

  const CreateTransactionFormInfoTab({
    Key? key,
    required this.fieldName,
    required this.value,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: LayoutContainer(
        height: 25.0,
        width: ContainerWidth.Full,
        child: BaseRow(
          label: fieldName,
          middle: Center(
            child: Text(
              this.value,
              style: defaultTextStyle,
            ),
          ),
          last: Center(
            child: Text(
              this.unit,
              style: defaultTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
