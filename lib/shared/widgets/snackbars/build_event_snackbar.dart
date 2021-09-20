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

class DefaultSnackBarContent extends StatefulWidget {
  final String message;
  final CallBackAction? action;

  const DefaultSnackBarContent({
    Key? key,
    this.action,
    required this.message,
  }) : super(key: key);

  @override
  _DefaultSnackBarContentState createState() => _DefaultSnackBarContentState();
}

class _DefaultSnackBarContentState extends State<DefaultSnackBarContent> {
  String _message = "";
  CallBackAction? _action;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    this._message = this.widget.message;
    this._action = this.widget.action;
  }

  Widget _buildText(String text, double height) {
    return Text(
      text,
      style: defaultTextStyle.copyWith(
        fontSize: height * (primaryTextStyleSize / snackBarHeight),
      ),
    );
  }

  Widget _buildCallbackActionWidget(double height) {
    if (this._action == null) {
      return Container();
    }

    if (!this._isActive) {
      return _buildText(
        "Ok",
        height,
      );
    }

    return GestureDetector(
      onTap: () {
        this._action!.callback();
        this._isActive = false;
        setState(() {});
      },
      child: _buildText(
        this._action!.label,
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
              _message,
              height,
            ),
            this._buildCallbackActionWidget(
              height,
            ),
          ],
        );
      },
    );
  }
}
