import 'package:crypto_journal_mobile/app/balance/data/inputs/get_balance_input.dart';
import 'package:crypto_journal_mobile/app/balance/data/models/balance_model.dart';

abstract class IBalanceRemoteDataSource {
  Future<BalanceModel> getBalance({
    required GetBalanceInput getBalanceInput,
  });
}
