import 'package:crypto_journal_mobile/app/user/presentation/pages/home/home_page.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/widgets/headers/section_header.dart';
import "package:flutter/material.dart";

class CreateTransactionPageHeader extends StatelessWidget {
  const CreateTransactionPageHeader({
    Key? key,
  }) : super(key: key);

  void _navigateBack(BuildContext context) async {
    bool canPop = Navigator.canPop(context);

    if (canPop) {
      return Navigator.pop(context);
    }

    Navigator.pushNamedAndRemoveUntil(
        context, HomePage.route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: "Create Transaction",
      titleAligment: Alignment.center,
      leadingBuilder: (
        BuildContext context,
        double height,
      ) {
        return GestureDetector(
          onTap: () => this._navigateBack(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: textColorPrimary,
            size: height * pageTitleTextStyleSize / defaultHeight,
          ),
        );
      },
      trailingBuilder: (
        BuildContext context,
        double height,
      ) {
        return Icon(
          Icons.arrow_back_ios,
          color: Colors.transparent,
          size: height * pageTitleTextStyleSize / defaultHeight,
        );
      },
    );
  }
}
