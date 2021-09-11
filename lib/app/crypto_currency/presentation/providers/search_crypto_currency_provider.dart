import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/search_crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/services/crypto_currency_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchStringStateProvider =
    StateProvider<String>((ProviderReference ref) {
  return "";
});

final searchCryptoCurrencyProvider =
    FutureProvider.autoDispose<List<CryptoCurrencyDto>>((
  ProviderReference ref,
) async {
  final searchString = ref.watch(searchStringStateProvider).state;
  final searchCryptoCurrencyService =
      await ref.read(cryptoCurrencyServiceProvider.future);

  final res = await searchCryptoCurrencyService.searchCryptoCurrency(
    searchCryptoCurrencyDto: SearchCryptoCurrencyDto(text: searchString),
  );

  final cryptoCurrencyRes = res.fold(
    (err) => throw Exception(),
    (cryptoCurrencies) => cryptoCurrencies,
  );

  return cryptoCurrencyRes;
});
