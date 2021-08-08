import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:crypto_journal_mobile/app/operation/service/repositories/operation_repository.dart';
import 'package:crypto_journal_mobile/app/operation/service/services/operation_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'operation_service_test.mocks.dart';

@GenerateMocks([IOperationRepository])
void main() {
  late MockIOperationRepository operationRepository;
  late OperationService operationService;
  final getOperationsResult = [
    OperationDto(
      id: "1",
      name: "Sell",
      slug: "sell",
      type: OperationType.SELL,
    ),
  ];

  setUp(() {
    operationRepository = MockIOperationRepository();
    operationService = OperationService(
      operationRepository: operationRepository,
    );
  });

  group("OperationService", () {
    test('should be an instance of IOperationService', () {
      // assert
      expect(operationService, isA<IOperationService>());
    });
  });

  group("OperationService.getOperations", () {
    test(
        'should call the getOperations method of the IOperationRepository class',
        () async {
      // arrange
      when(operationRepository.getOperations())
          .thenAnswer((_) => Future.value(Right(getOperationsResult)));

      // act
      final res = await operationService.getOperations();

      // assert
      verify(operationRepository.getOperations());
      expect(res, equals(Right(getOperationsResult)));
    });
  });
}
