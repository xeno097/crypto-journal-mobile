import 'dart:convert';

import 'package:crypto_journal_mobile/app/holding/data/models/holding_model.dart';
import 'package:crypto_journal_mobile/app/holding/service/dtos/get_holdings_dto.dart';
import 'package:crypto_journal_mobile/app/holding/service/repositories/holding_repository.dart';
import 'package:crypto_journal_mobile/app/holding/service/services/holding_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'holding_service_test.mocks.dart';

@GenerateMocks([IHoldingRepository])
void main() {
  late MockIHoldingRepository holdingRepository;
  late HoldingService holdingService;

  final holdingJson =
      json.decode(fixtureReader("holdings/holding_fixture.json"));
  final holdingDto = HoldingModel.fromJson(holdingJson);

  final getHoldingsResult = [holdingDto];

  setUp(() {
    holdingRepository = MockIHoldingRepository();
    holdingService = HoldingService(
      holdingRepository: holdingRepository,
    );
  });

  group("HoldingService", () {
    test('should be an instance of IHoldingService', () {
      // assert
      expect(holdingService, isA<IHoldingService>());
    });
  });

  group("HoldingService.getHoldings", () {
    test('should call the getHoldings method of the IHoldingRepository class',
        () async {
      // arrange
      when(
        holdingRepository.getHoldings(
          getHoldingsDto: anyNamed("getHoldingsDto"),
        ),
      ).thenAnswer((_) => Future.value(Right(getHoldingsResult)));

      final getHoldingsDto = GetHoldingsDto();

      // act
      final res =
          await holdingService.getHoldings(getHoldingsDto: getHoldingsDto);

      // assert
      verify(holdingRepository.getHoldings(getHoldingsDto: getHoldingsDto));
      expect(res, equals(Right(getHoldingsResult)));
    });
  });
}
