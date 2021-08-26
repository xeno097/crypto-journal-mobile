import 'dart:convert';

import 'package:crypto_journal_mobile/app/holding/data/models/holding_model.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/holding_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../shared/fixtures/fixture_reader.dart';

void main() {
  final holdingModel = HoldingModel(
    holding: 1,
    id: "1",
    name: "Ethereum",
    price: 1,
    symbol: "ETH",
    value: 1,
    icon: "https://github.com/",
  );

  final holdingModelWithNoIcon = HoldingModel(
    holding: 1,
    id: "1",
    name: "Ethereum",
    price: 1,
    symbol: "ETH",
    value: 1,
  );

  group("HoldingModel", () {
    test('it should be an instance of UserDto', () {
      expect(holdingModel, isA<HoldingDto>());
    });
  });

  group('HoldingModel.fromJson', () {
    test('it should return a valid HoldingModel when a valid json is provided',
        () {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixtureReader("holdings/holding_fixture.json"));

      // act
      final res = HoldingModel.fromJson(jsonMap);

      // assert
      expect(res, holdingModel);
    });

    test(
        'it should return a valid HoldingModel when a valid json is provided that has no icon field',
        () {
      // arrange
      final Map<String, dynamic> jsonMap = json
          .decode(fixtureReader("holdings/holding_without_icon_fixture.json"));

      // act
      final res = HoldingModel.fromJson(jsonMap);

      // assert
      expect(res, holdingModelWithNoIcon);
    });
  });
}
