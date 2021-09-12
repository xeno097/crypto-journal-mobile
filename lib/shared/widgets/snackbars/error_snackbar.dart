import 'package:crypto_journal_mobile/shared/errors/unexpected/unexpected_error.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar({String message = UNEXPECTED_ERROR_MESSAGE}) {
  return SnackBar(
    backgroundColor: googleButtonBackGroundColor,
    content: Text(message),
  );
}
