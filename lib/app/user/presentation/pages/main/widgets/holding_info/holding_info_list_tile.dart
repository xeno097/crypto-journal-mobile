import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_tile_widget.dart';
import "package:flutter/material.dart";

class HoldingInfoListTile extends StatelessWidget {
  final HoldingDto holdingDto;

  const HoldingInfoListTile({
    Key? key,
    required this.holdingDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, height) {
        final padding = height * (defaultContainerPadding / defaultHeight);
        final iconSize = height - 2 * padding;

        return BaseTileWidget(
          padding: padding,
          leading: Row(
            children: [
              Icon(
                Icons.monetization_on_outlined,
                size: iconSize,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultRowItemPadding,
                ),
                child: Text(
                  this.holdingDto.symbol,
                  style: subTitleTextStyle.copyWith(
                    fontSize: height * (subTitleTextStyleSize / defaultHeight),
                  ),
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$ ${this.holdingDto.value.toStringAsFixed(
                      decimalDigits,
                    )}",
                style: defaultTextStyle.copyWith(
                  fontSize: height * (primaryTextStyleSize / defaultHeight),
                ),
              ),
              Text(
                "${this.holdingDto.holding.toStringAsFixed(
                      decimalDigits,
                    )}",
                style: secondaryTextStyle.copyWith(
                  fontSize: height * (secondaryTextStyleSize / defaultHeight),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
