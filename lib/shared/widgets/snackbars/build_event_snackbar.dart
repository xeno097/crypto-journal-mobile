import 'package:crypto_journal_mobile/shared/classes/call_back_action.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:flutter/material.dart';

SnackBar buildEventSnackBar({
  Color color = textColorStonks,
  String message = "Success",
  CallBackAction? callBackAction,
}) {
  return SnackBar(
    backgroundColor: color,
    content: DefaultSnackBarContent(
      message: message,
      action: callBackAction,
    ),
  );
}

class DefaultSnackBarContent extends StatelessWidget {
  final String message;
  final CallBackAction? action;

  const DefaultSnackBarContent({
    Key? key,
    this.action,
    required this.message,
  }) : super(key: key);

  Widget _buildText(String text, double height) {
    return Text(
      text,
      style: defaultTextStyle.copyWith(
        fontSize: height * (primaryTextStyleSize / snackBarHeight),
      ),
    );
  }

  Widget _buildCallbackActionWidget(
    BuildContext context,
    double height,
  ) {
    if (this.action == null) {
      return Container();
    }

    return GestureDetector(
      onTap: () {
        this.action!.callback();

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: _buildText(
        this.action!.label,
        height,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      heigthProp: snackBarHeight,
      builder: (context, size) {
        final height = size.height;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            this._buildText(
              message,
              height,
            ),
            this._buildCallbackActionWidget(
              context,
              height,
            ),
          ],
        );
      },
    );
  }
}
