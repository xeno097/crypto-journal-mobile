import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  const DefaultCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: textColorSecondary,
      ),
    );
  }
}
