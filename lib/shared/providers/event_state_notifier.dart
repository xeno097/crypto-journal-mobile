import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'event_state.dart';

final notificationStateNotifierProvider =
    StateNotifierProvider<EventStateNotifier, EventState>(
  (
    ProviderReference ref,
  ) =>
      EventStateNotifier(),
);

class EventStateNotifier extends StateNotifier<EventState> {
  EventStateNotifier()
      : super(
          InitialEventState(),
        );

  void setEventState(EventState state) {
    this.state = state;
  }
}
