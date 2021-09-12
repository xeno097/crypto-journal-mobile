import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:flutter/material.dart';

SnackBar buildSuccessSnackBar({String message = "Success"}) {
  return SnackBar(
    backgroundColor: textColorStonks,
    content: Text(message),
  );
}
