import 'package:crypto_journal_mobile/app/operation/data/data_sources/operation_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/operation/data/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'operation_repository_test.mocks.dart';

@GenerateMocks([
  IOperationRemoteDataSource,
  INetworkInfo,
])
void main() {
  late MockIOperationRemoteDataSource operationRemoteDataSource;
  late MockINetworkInfo networkInfo;
  late OperationRepository operationRepository;

  setUp(() {
    operationRemoteDataSource = MockIOperationRemoteDataSource();
    networkInfo = MockINetworkInfo();
    operationRepository = OperationRepository(
      operationRemoteDataSource: operationRemoteDataSource,
      networkInfo: networkInfo,
    );
  });

  group("OperationRepository", () {
    test('should be an instance of IOperationRepository', () {
      // assert
      expect(operationRepository, isA<IOperationRepository>());
    });
  });

  group("OperationRepository.getOperations", () {
    test('should ', () {
      // arrange

      // act

      // assert
    });
  });
}
