import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import "package:flutter/material.dart";

class HoldingInfoListTile extends StatelessWidget {
  final HoldingDto holdingDto;

  const HoldingInfoListTile({
    Key? key,
    required this.holdingDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: defaultWidth / defaultHeight,
      child: LayoutBuilder(
        builder: (context, constratins) {
          final currHeight = constratins.maxHeight;
          final padding =
              currHeight * (defaultContainerPadding / defaultHeight);
          final iconSize = currHeight - 2 * padding;

          return DefaultContainer(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  size: iconSize,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    this.holdingDto.symbol,
                    style: subTitleTextStyle.copyWith(
                      fontSize:
                          currHeight * (subTitleTextStyleSize / defaultHeight),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$ ${this.holdingDto.value.toStringAsFixed(
                            decimalDigits,
                          )}",
                      style: defaultTextStyle.copyWith(
                        fontSize:
                            currHeight * (primaryTextStyleSize / defaultHeight),
                      ),
                    ),
                    Text(
                      "${this.holdingDto.holding.toStringAsFixed(
                            decimalDigits,
                          )}",
                      style: secondaryTextStyle.copyWith(
                        fontSize: currHeight *
                            (secondaryTextStyleSize / defaultHeight),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
