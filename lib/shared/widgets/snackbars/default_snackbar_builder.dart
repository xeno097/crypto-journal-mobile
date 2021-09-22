import 'package:crypto_journal_mobile/shared/classes/snackbar_builder_action.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:flutter/material.dart';

abstract class DefaultSnackBarBuilder {
  static SnackBarAction? _getAction(
    SnackBuilderAction? action,
  ) {
    if (action == null) {
      return null;
    }

    return SnackBarAction(
      label: action.label,
      onPressed: action.action,
    );
  }

  static SnackBar buildSnackBar({
    SnackBuilderAction? action,
    required String message,
    Color color = textColorStonks,
  }) {
    return SnackBar(
      backgroundColor: color,
      content: DefaultSnackBarContent(
        message: message,
      ),
      action: _getAction(action),
    );
  }
}

class DefaultSnackBarContent extends StatelessWidget {
  final String message;
  final double _snackbarHeight = snackBarHeight;

  const DefaultSnackBarContent({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      heigthProp: _snackbarHeight,
      builder: (context, size) {
        final height = size.height;

        return Container(
          child: Text(
            this.message,
            style: defaultTextStyle.copyWith(
              fontSize: height * (primaryTextStyleSize / _snackbarHeight),
            ),
          ),
        );
      },
    );
  }
}
