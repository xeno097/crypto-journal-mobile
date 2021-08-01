import 'package:crypto_journal_mobile/app/user/presentation/pages/history/history.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/main/main_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/settings/settings_page.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String route = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backGroundColorPrimary,
        body: Container(
          child: TabBarView(
            children: [
              MainPage(),
              HistoryPage(),
              SettingsPage(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(21.0),
          child: BaseButton(
            backGroundColor: backGroundColorSecondary,
            child: TabBar(
              indicatorColor: Colors.transparent,
              tabs: [
                Icon(Icons.home),
                Icon(Icons.sync),
                Icon(Icons.account_circle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}