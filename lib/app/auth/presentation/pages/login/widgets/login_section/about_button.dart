import 'package:crypto_journal_mobile/shared/constants/constants.dart';
import 'package:crypto_journal_mobile/shared/functions/launch_url.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/base_button.dart';
import 'package:crypto_journal_mobile/shared/widgets/buttons/default_text_button.dart';
import "package:flutter/material.dart";

class AboutButton extends StatelessWidget {
  const AboutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextButton(
      text: "About the app",
      width: ButtonWidth.Half,
      hasDecoration: false,
      fontSizeProp: secondaryTextStyleSize,
      onTap: () async => await openUrl(GITHUB_PROJECT_URL),
    );
  }
}
