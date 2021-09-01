import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/balance_info/balance_info_card.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/section_header.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/widgets/holding_info/holding_info_list.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import "package:flutter/material.dart";

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MainPage");

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPagePadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SectionHeader(
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
