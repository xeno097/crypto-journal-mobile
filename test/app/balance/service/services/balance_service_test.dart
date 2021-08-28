import 'dart:convert';

import 'package:crypto_journal_mobile/app/balance/data/models/balance_model.dart';
import 'package:crypto_journal_mobile/app/balance/service/dtos/get_balance_dto.dart';
import 'package:crypto_journal_mobile/app/balance/service/repositories/balance_repository.dart';
import 'package:crypto_journal_mobile/app/balance/service/services/balance_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../shared/fixtures/fixture_reader.dart';
import 'balance_service_test.mocks.dart';

@GenerateMocks([IBalanceRepository])
void main() {
  late MockIBalanceRepository balanceRepositoryMock;
  late BalanceService balanceService;

  final balanceJson =
      json.decode(fixtureReader("balance/balance_fixture.json"));
  final balanceDto = BalanceModel.fromJson(balanceJson);

  setUp(() {
    balanceRepositoryMock = MockIBalanceRepository();
    balanceService = BalanceService(
      balanceRepository: balanceRepositoryMock,
    );
  });

  group("BalanceService", () {
    test('should be an instance of IBalanceService', () {
      // assert
      expect(balanceService, isA<IBalanceService>());
    });
  });

  group("BalanceService.getBalance", () {
    test('should call the getBalance method of the IBalanceRepository class',
        () async {
      // arrange
      when(
        balanceRepositoryMock.getBalance(
          getBalanceDto: anyNamed("getBalanceDto"),
        ),
      ).thenAnswer((_) => Future.value(Right(balanceDto)));

      final getBalanceDto = GetBalanceDto();

      // act
      final res = await balanceService.getBalance(getBalanceDto: getBalanceDto);

      // assert
      verify(balanceRepositoryMock.getBalance(getBalanceDto: getBalanceDto));
      expect(res, equals(Right(balanceDto)));
    });
  });
}
