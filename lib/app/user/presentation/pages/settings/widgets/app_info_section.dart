import 'package:crypto_journal_mobile/app/user/presentation/pages/settings/widgets/setting_tab.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class AppInfoSection extends StatelessWidget {
  const AppInfoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingTab(
      title: "App Info",
      children: [
        Text(
          "Version 0.0.1",
          style: defaultTextStyle,
        ),
        Text(
          "Github",
          style: defaultTextStyle,
        ),
      ],
    );
  }
}
