import 'package:crypto_journal_mobile/shared/providers/event_state.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state_notifier.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/snackbars/default_snackbar_builder.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget child;
  final bool isListener;

  const DefaultScaffold({
    Key? key,
    this.isListener = true,
    required this.child,
  }) : super(key: key);

  Widget _build() {
    if (!this.isListener) {
      return this.child;
    }

    return ProviderListener(
      provider: notificationStateNotifierProvider,
      onChange: (
        BuildContext context,
        EventState state,
      ) {
        if (state is SuccessEventState) {
          ScaffoldMessenger.of(context).showSnackBar(
            DefaultSnackBarBuilder.buildSnackBar(
              color: textColorStonks,
              message: state.message,
            ),
          );
        }

        if (state is ErrorEventState) {
          ScaffoldMessenger.of(context).showSnackBar(
            DefaultSnackBarBuilder.buildSnackBar(
              color: googleButtonBackGroundColor,
              message: state.error.message,
            ),
          );
        }
      },
      child: this.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColorPrimary,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: defaultBackgroundGradient,
        ),
        child: this._build(),
      ),
    );
  }
}
