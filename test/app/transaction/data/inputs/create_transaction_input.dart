import 'package:crypto_journal_mobile/app/transaction/data/inputs/create_transaction_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CreateTransactionInput.toJson", () {
    test('should return a json map containing the userName field', () {
      // arrange
      final coinPrice = 1000.0;
      final coinSymbol = "ETH";
      final coins = 0.46;
      final date = "12/06/2020";
      final fee = 0.0;
      final operation = "1";

      final createTransactionInput = CreateTransactionInput(
        coinPrice: coinPrice,
        coinSymbol: coinSymbol,
        coins: coins,
        date: date,
        fee: fee,
        operation: operation,
      );

      final expectedResult = {
        "coinPrice": coinPrice,
        "coinSymbol": coinSymbol,
        "coins": coins,
        "date": date,
        "fee": fee,
        "operation": operation,
      };

      // act
      final res = createTransactionInput.toJson();

      // assert
      expect(res, expectedResult);
    });
  });
}
