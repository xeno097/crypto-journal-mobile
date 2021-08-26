import 'package:crypto_journal_mobile/app/holding/data/inputs/get_holding_input.dart';
import 'package:crypto_journal_mobile/app/holding/data/models/holding_model.dart';

abstract class IHoldingRemoteDataSource {
  Future<List<HoldingModel>> getHoldings({
    required GetHoldingInput getHoldingInput,
  });
}
