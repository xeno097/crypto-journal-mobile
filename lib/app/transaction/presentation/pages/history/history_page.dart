import 'package:crypto_journal_mobile/app/user/presentation/pages/home/widgets/tab_container.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import "package:flutter/material.dart";

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HistoryPage");

    return TabContainer(
      header: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Transaction History",
                style: pageTitleTextStyle,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("ADD TRANSACTION");
            },
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: textColorPrimary,
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text("History Page"),
        ),
      ),
    );
  }
}
