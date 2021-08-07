import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';

abstract class IOperationRemoteDataSource {
  Future<List<OperationModel>> getOperations();
}
