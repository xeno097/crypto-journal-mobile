import 'package:crypto_journal_mobile/app/auth/presentation/pages/settings/settings_page.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/history/transaction_history_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/main_page.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/scaffold/default_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String route = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: DefaultScaffold(
        child: Stack(
          children: [
            TabBarView(
              children: [
                MainPage(),
                TransactionHistoryPage(),
                SettingsPage(),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(
                bottom: defaultPagePadding,
              ),
              child: BaseButton(
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: textColorSecondary,
                  onTap: (index) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                  },
                  tabs: [
                    Icon(Icons.home),
                    Icon(Icons.sync),
                    Icon(Icons.account_circle)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
