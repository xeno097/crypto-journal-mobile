import 'package:crypto_journal_mobile/app/user/presentation/pages/home/widgets/tab_container.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/login/login_page.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/settings/widgets/app_info_section.dart';
import 'package:crypto_journal_mobile/app/user/presentation/pages/settings/widgets/user_info_section.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/get_logged_user_provider.dart';
import 'package:crypto_journal_mobile/app/user/presentation/providers/sign_out_provider.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/layout_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void _signOut(BuildContext context) async {
    final signOut = await context.read(signOutProvider.future);

    if (!signOut) {
      print("ERROR");
    }

    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginPage.route,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("SettingsPage");

    return TabContainer(
      header: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Settings",
          style: pageTitleTextStyle,
        ),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final userDto = watch(getLoggedUserProvider);

          return userDto.map(
            data: (userDto) => Column(
              children: [
                UserInfoSection(
                  userDto: userDto.value,
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppInfoSection(),
                SizedBox(
                  height: 25.0,
                ),
                BaseButton(
                  backGroundColor: googleButtonBackGroundColor,
                  width: ContainerWidth.Small,
                  onTap: () async => this._signOut(context),
                  child: Center(
                    child: Text(
                      "Log out",
                      style: secondaryTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            loading: (_) => Center(
              child: CircularProgressIndicator(),
            ),
            error: (err) => Text("Error? "),
          );
        },
      ),
    );
  }
}
