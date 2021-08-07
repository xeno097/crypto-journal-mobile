import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("OperationModel", () {
    test('should be an instance of OperationDto', () {
      // arrange
      final operationModel = OperationModel(
        id: "1234567890",
        name: "Sell",
        slug: "sell",
        type: OperationType.SELL,
      );

      // act

      // assert
      expect(operationModel, isA<OperationDto>());
    });
  });
}
