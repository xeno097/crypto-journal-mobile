import 'package:crypto_journal_mobile/shared/providers/event_state.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state_notifier.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/widgets/snackbars/error_snackbar.dart';
import 'package:crypto_journal_mobile/shared/widgets/snackbars/success_snackbar.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget child;

  const DefaultScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColorPrimary,
      body: ProviderListener(
        provider: notificationStateNotifierProvider,
        onChange: (
          BuildContext context,
          EventState state,
        ) {
          if (state is SuccessEventState) {
            ScaffoldMessenger.of(context).showSnackBar(
              buildSuccessSnackBar(message: state.message),
            );
          }

          if (state is ErrorEventState) {
            ScaffoldMessenger.of(context).showSnackBar(
              buildErrorSnackBar(message: state.error.message),
            );
          }
        },
        child: this.child,
      ),
    );
  }
}
