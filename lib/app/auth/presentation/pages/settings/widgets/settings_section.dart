import 'package:crypto_journal_mobile/app/auth/presentation/pages/settings/widgets/log_out_button.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/functions/launch_url.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/group_section/group_section.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/group_section/group_section_tile.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/last_list_element.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final UserDto user;

  const SettingsSection({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GroupedSection(
          title: "User Info",
          children: [
            GroupSectionTile(
              label: user.userName,
            ),
            GroupSectionTile(
              label: user.email,
            ),
          ],
        ),
        GroupedSection(
          title: "App Info",
          children: [
            GroupSectionTile(
              label: "Version 0.1.0",
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
        LastListElement(),
      ],
    );
  }
}
