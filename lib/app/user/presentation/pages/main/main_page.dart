import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/shadows.dart';
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
              MainPageHeader(),
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
              decoration: BoxDecoration(
                boxShadow: defaultElementShadow,
                color: backGroundColorSecondary,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            );
          },
        ));
  }
}

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 369 / 51,
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Home",
          style: boldPageTitleTextStyle,
        ),
      ),
    );
  }
}

class BalanceInfoCard extends StatelessWidget {
  const BalanceInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 369 / 150,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Current balance",
                style: defaultTextStyle,
              ),
              Text(
                "\$ 4790.67",
                style: boldMainTitleTextStyle,
              ),
              Text(
                "0.1257 BTC",
                style: defaultTextStyleSecondary,
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: defaultElementShadow,
          color: backGroundColorSecondary,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
}
