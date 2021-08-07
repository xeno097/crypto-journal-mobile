import 'package:crypto_journal_mobile/app/operation/data/data_sources/operation_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/operation/data/repositories/operation_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'operation_repository_test.mocks.dart';

@GenerateMocks([IOperationRemoteDataSource])
void main() {
  late MockIOperationRemoteDataSource operationRemoteDataSource;
  late OperationRepository operationRepository;

  setUp(() {
    operationRemoteDataSource = MockIOperationRemoteDataSource();
    operationRepository = OperationRepository(
      operationRemoteDataSource: operationRemoteDataSource,
    );
  });
}
