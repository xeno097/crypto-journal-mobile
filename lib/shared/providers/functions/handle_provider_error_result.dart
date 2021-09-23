import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

T handleProviderErrorResult<T>({
  required ProviderReference providerReference,
  required BaseError error,
  required T Function() callback,
}) {
  providerReference
      .read(notificationStateNotifierProvider.notifier)
      .setEventState(
        ErrorEventState(
          error: error,
        ),
      );

  return callback();
}
