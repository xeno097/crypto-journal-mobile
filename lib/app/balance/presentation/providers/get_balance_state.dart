import 'package:crypto_journal_mobile/app/balance/service/dtos/balance_dto.dart';

abstract class GetBalanceState {}

class InitialGetBalanceState extends GetBalanceState {}

class LoadingGetBalanceState extends GetBalanceState {}

class LoadedGetBalanceState extends GetBalanceState {
  final BalanceDto balance;

  LoadedGetBalanceState({
    required this.balance,
  });
}

class ErrorGetBalanceState extends GetBalanceState {}
