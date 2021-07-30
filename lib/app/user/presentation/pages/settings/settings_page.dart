import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SettingsPage");

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 21.0,
          right: 21.0,
          top: 21.0,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Settings",
              style: pageTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
