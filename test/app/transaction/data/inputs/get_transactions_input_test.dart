import 'package:crypto_journal_mobile/app/transaction/data/inputs/get_transaction_input.dart';
import 'package:crypto_journal_mobile/app/transaction/service/dtos/get_transactions_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final limit = 15;
  final start = 0;

  final getTransactionsInput = GetTransactionsInput(
    limit: limit,
    start: start,
  );

  group("GetTransactionInput", () {
    test('should be an instance of GetTransactionsDto', () {
      // assert
      expect(getTransactionsInput, isA<GetTransactionsDto>());
    });
  });

  group("GetTransactionInput.toJson", () {
    test('should return a json map containing the limit and start fields', () {
      // arrange

      final expectedResult = {
        "start": start,
        "limit": limit,
      };

      // act
      final res = getTransactionsInput.toJson();

      // assert
      expect(res, expectedResult);
    });
  });
}
