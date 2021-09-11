import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import "package:flutter/material.dart";

class CreateTransactionPriceInfoHeader extends StatelessWidget {
  final double total;
  final double fees;

  const CreateTransactionPriceInfoHeader({
    Key? key,
    required this.total,
    required this.fees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      heigthProp: createTransactionInfoHeight,
      builder: (
        BuildContext context,
        Size size,
      ) {
        return Center(
          child: BaseLayoutContainer(
            heigthProp: loginPageMainTitleSectionHeight,
            builder: (
              BuildContext context,
              Size size,
            ) {
              final height = size.height;

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$${this.total.toStringAsFixed(2)}",
                    style: boldDefaultTextStyle.copyWith(
                      fontSize: height * 36 / loginPageMainTitleSectionHeight,
                    ),
                  ),
                  Text(
                    "\$${this.fees.toStringAsFixed(2)} fees",
                    style: defaultTextStyle.copyWith(
                      fontSize: height *
                          primaryTextStyleSize /
                          loginPageMainTitleSectionHeight,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
