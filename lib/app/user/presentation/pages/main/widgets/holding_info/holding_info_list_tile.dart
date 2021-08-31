import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
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
          final padding = currHeight * (defaultPadding / defaultHeight);
          final iconSize = currHeight - 2 * padding;

          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: padding,
            ),
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
                      "\$ ${this.holdingDto.value}",
                      style: defaultTextStyle.copyWith(
                        fontSize:
                            currHeight * (primaryTextStyleSize / defaultHeight),
                      ),
                    ),
                    Text(
                      "${this.holdingDto.holding}",
                      style: secondaryTextStyle.copyWith(
                        fontSize: currHeight *
                            (secondaryTextStyleSize / defaultHeight),
                      ),
                    )
                  ],
                )
              ],
            ),
            decoration: defaultContainerDecoration,
          );
        },
      ),
    );
  }
}
