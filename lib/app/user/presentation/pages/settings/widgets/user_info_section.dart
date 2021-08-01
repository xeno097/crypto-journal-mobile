import 'package:crypto_journal_mobile/app/user/presentation/pages/settings/widgets/setting_tab.dart';
import 'package:crypto_journal_mobile/app/user/service/dtos/user_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class UserInfoSection extends StatelessWidget {
  final UserDto userDto;

  const UserInfoSection({
    Key? key,
    required this.userDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingTab(
      title: "User Info",
      children: [
        Text(
          userDto.userName,
          style: defaultTextStyle,
        ),
        Text(
          userDto.email,
          style: defaultTextStyle,
        ),
      ],
    );
  }
}
