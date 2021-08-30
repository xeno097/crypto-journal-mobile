import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class HoldingInfoListTile extends StatelessWidget {
  const HoldingInfoListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 369 / 51,
      child: LayoutBuilder(
        builder: (context, constratins) {
          final currHeight = constratins.maxHeight;
          final padding = currHeight * (9.0 / 51.0);
          final iconSize = currHeight - 2 * padding;
          // final currencyTextSize =
          final c = currHeight * (12 / 51);

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
                    "BTC",
                    style: subTitleTextStyle.copyWith(
                      fontSize: currHeight * (18 / 51),
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
                      "\$356.08914",
                      style: defaultTextStyle.copyWith(
                        fontSize: currHeight / (51 / 15),
                      ),
                    ),
                    Text(
                      "1.55670",
                      style: secondaryTextStyle.copyWith(
                        fontSize: c,
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