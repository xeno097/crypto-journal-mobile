abstract class LocalStorage {
  Future<bool> setData(SetDataDto setDataDto);
  Future<String> getData(GetDataDto getDataDto);
}

class SetDataDto {
  final String key;
  final String value;

  SetDataDto({
    required this.key,
    required this.value,
  });
}

class GetDataDto {
  final String key;

  GetDataDto({
    required this.key,
  });
}
