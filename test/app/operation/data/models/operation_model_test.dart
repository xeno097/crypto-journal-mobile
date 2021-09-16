import 'dart:convert';

import 'package:crypto_journal_mobile/app/operation/data/models/operation_model.dart';
import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../shared/fixtures/fixture_reader.dart';

void main() {
  final operationModel = OperationModel(
    id: "1",
    name: "Sell",
    slug: "sell",
    type: OperationType.SELL,
  );
  group("OperationModel", () {
    test('should be an instance of OperationDto', () {
      // assert
      expect(operationModel, isA<OperationDto>());
    });
  });

  group("OperationModel.fromJason", () {
    test('should return a valid OperationModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixtureReader("operations/operation_fixture.json"));

      // act
      final res = OperationModel.fromJson(jsonMap);

      // assert
      expect(res, operationModel);
    });
  });
}
