import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<bool> setData(SetDataDto setDataDto);
  Future<String> getData(GetDataDto getDataDto);
}

class SetDataDto extends Equatable {
  final String key;
  final String value;

  SetDataDto({
    required this.key,
    required this.value,
  });

  @override
  List<Object?> get props => [
        this.key,
        this.value,
      ];
}

class GetDataDto extends Equatable {
  final String key;

  GetDataDto({
    required this.key,
  });

  @override
  List<Object?> get props => [
        this.key,
      ];
}

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPreferences;

  LocalStorageImpl({
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
}
