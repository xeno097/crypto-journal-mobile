import 'package:crypto_journal_mobile/shared/providers/event_state.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

T handleProviderSuccessResult<T>(ProviderReference ref, T Function() callback,
    {String? message}) {
  final successEvent = message == null
      ? SuccessEventState()
      : SuccessEventState(message: message);

  ref.read(notificationStateNotifierProvider.notifier).setEventState(
        successEvent,
      );

  return callback();
}
