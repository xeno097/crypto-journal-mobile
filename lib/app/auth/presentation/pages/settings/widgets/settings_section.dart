import 'package:crypto_journal_mobile/app/auth/presentation/pages/settings/widgets/log_out_button.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/get_logged_user_provider.dart';
import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/functions/launch_url.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/group_section/group_section.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/group_section/group_section_tile.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final request = watch(getLoggedUserProvider);

        return request.when(
          data: (value) {
            return Column(
              children: [
                GroupedSection(
                  title: "User Info",
                  children: [
                    GroupSectionTile(
                      label: value.userName,
                    ),
                    GroupSectionTile(
                      label: value.email,
                    ),
                  ],
                ),
                GroupedSection(
                  title: "App Info",
                  children: [
                    GroupSectionTile(
                      label: "Version 0.0.2",
                    ),
                    GroupSectionTile(
                      label: "Github",
                      onTap: () async => await openUrl(GITHUB_PROJECT_URL),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultListElementPadding,
                ),
                LogOutButton(),
              ],
            );
          },
          loading: () => DefaultCircularProgressIndicator(),
          error: (err, _) => Text("Error?"),
        );
      },
    );
  }
}
