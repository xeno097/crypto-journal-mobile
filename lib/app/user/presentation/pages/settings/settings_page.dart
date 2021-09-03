import 'package:crypto_journal_mobile/app/user/presentation/pages/settings/widgets/settings_section.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_page_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/section_header.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SettingsPage");

    return DefaultPageContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionHeader(
              title: "Settings",
            ),
            SettingsSection(),
          ],
        ),
      ),
    );
  }
}
