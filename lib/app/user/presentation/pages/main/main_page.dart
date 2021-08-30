import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/balance_info/balance_info_card.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/header/main_page_header.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MainPage");

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(
                title: "Home",
              ),
              BalanceInfoCard(),
              HoldingInfoList(),
            ],
          ),
        ),
      ),
    );
  }
}

class HoldingInfoList extends StatelessWidget {
  const HoldingInfoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 369 / 51,
          child: Container(
            height: 50.0,
            alignment: Alignment.centerLeft,
            child: Text(
              "Holding",
              style: pageTitleTextStyle,
            ),
          ),
        ),
        HoldingInfoListTile(),
        Container(
            margin: EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            child: HoldingInfoListTile()),
      ],
    );
  }
}

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
