import 'package:crypto_journal_mobile/shared/errors/base_error.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state.dart';
import 'package:crypto_journal_mobile/shared/providers/event_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

T handleProviderErrorResult<T>(ProviderReference ref, BaseError error,
    {T Function()? callback}) {
  ref.read(notificationStateNotifierProvider.notifier).setErrorState(
        ErrorEventState(
          error: error,
        ),
      );

  if (callback != null) {
    return callback();
  }

  throw error;
}
