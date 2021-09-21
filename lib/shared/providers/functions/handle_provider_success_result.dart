import 'package:crypto_journal_mobile/shared/classes/call_back_action.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

T handleProviderSuccessResult<T>(
  ProviderReference ref,
  T Function() callback, {
  String? message,
  CallBackAction? action,
}) {
  final successEvent = message == null
      ? SuccessEventState(
          action: action,
        )
      : SuccessEventState(
          message: message,
          action: action,
        );

  ref.read(notificationStateNotifierProvider.notifier).setEventState(
        successEvent,
      );

  return callback();
}
