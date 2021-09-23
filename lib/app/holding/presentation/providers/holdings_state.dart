import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';

abstract class HoldingsState {}

class InitialHoldingsState extends HoldingsState {}

class LoadingHoldingsState extends HoldingsState {}

class LoadedHoldingsState extends HoldingsState {
  final List<HoldingDto> holdings;

  LoadedHoldingsState({
    required this.holdings,
  });
}

class ErrorHoldingsState extends HoldingsState {}
