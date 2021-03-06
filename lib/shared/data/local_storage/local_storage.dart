import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/set_data_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorage {
  Future<bool> setData(SetDataDto setDataDto);
  Future<String> getData(GetDataDto getDataDto);
  Future<bool> removeData(GetDataDto deleteDataDto);
}

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ProviderReference ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  return sharedPreferences;
});

final localStorageProvider =
    FutureProvider<ILocalStorage>((ProviderReference ref) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);

  final localStorage = LocalStorage(sharedPreferences: sharedPreferences);
  return localStorage;
});

class LocalStorage implements ILocalStorage {
  final SharedPreferences _sharedPreferences;

  LocalStorage({
    required SharedPreferences sharedPreferences,
  }) : this._sharedPreferences = sharedPreferences;

  @override
  Future<String> getData(GetDataDto getDataDto) {
    final String res = this._sharedPreferences.getString(
              getDataDto.key,
            ) ??
        "";

    return Future.value(res);
  }

  @override
  Future<bool> setData(SetDataDto setDataDto) async {
    final res = await this._sharedPreferences.setString(
          setDataDto.key,
          setDataDto.value,
        );

    return res;
  }

  @override
  Future<bool> removeData(GetDataDto deleteDataDto) async {
    final res = await this._sharedPreferences.remove(
          deleteDataDto.key,
        );

    return res;
  }
}
