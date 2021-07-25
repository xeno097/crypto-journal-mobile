import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/get_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/dtos/set_data_dto.dart';
import 'package:crypto_journal_mobile/shared/data/local_storage/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences sharedPreferencesMock;
  late ILocalStorage localStorage;
  final String testKey = "TEST_KEY";
  final String testValue = "TEST_VALUE";
  final SetDataDto setDataDto = SetDataDto(
    key: testKey,
    value: testValue,
  );

  final GetDataDto getDataDto = GetDataDto(
    key: testKey,
  );

  setUp(() {
    sharedPreferencesMock = MockSharedPreferences();
    localStorage = LocalStorage(
      sharedPreferences: sharedPreferencesMock,
    );
  });

  group("LocalStorage", () {
    test("should be an instance of ILocalStorage", () {
      // assert
      expect(localStorage, isA<ILocalStorage>());
    });
  });

  group("LocalStorage.getData", () {
    test('should call the getString method of the SharedPreferences class',
        () async {
      // arrange
      when(sharedPreferencesMock.getString(any)).thenReturn(setDataDto.value);

      // act
      await localStorage.getData(getDataDto);

      // assert
      verify(sharedPreferencesMock.getString(setDataDto.key));
    });

    test('should return the stored string given the key', () async {
      // arrange
      when(sharedPreferencesMock.getString(any)).thenReturn(setDataDto.value);

      // act
      final res = await localStorage.getData(getDataDto);

      // assert
      verify(sharedPreferencesMock.getString(setDataDto.key));
      expect(res, setDataDto.value);
    });
  });

  group("LocalStorage.setData", () {
    test('should call the setString method of the SharedPreferences class',
        () async {
      // arrange
      when(sharedPreferencesMock.setString(any, any))
          .thenAnswer((_) => Future.value(true));

      // act
      await localStorage.setData(setDataDto);

      // assert
      verify(sharedPreferencesMock.setString(setDataDto.key, setDataDto.value));
    });

    test('should return true if the data has been successfully stored',
        () async {
      // arrange
      when(sharedPreferencesMock.setString(any, any))
          .thenAnswer((_) => Future.value(true));

      // act
      final res = await localStorage.setData(setDataDto);

      // assert
      verify(sharedPreferencesMock.setString(setDataDto.key, setDataDto.value));
      expect(res, true);
    });
  });

  group("LocalStorage.deleteData", () {
    test('should call the remove method of the SharedPreferences class',
        () async {
      // arrange
      when(sharedPreferencesMock.remove(any))
          .thenAnswer((_) => Future.value(true));

      // act
      await localStorage.removeData(getDataDto);

      // assert
      verify(sharedPreferencesMock.remove(getDataDto.key));
    });

    test('should return true if the data has been successfully deleted',
        () async {
      // arrange
      when(sharedPreferencesMock.remove(any))
          .thenAnswer((_) => Future.value(true));

      // act
      final res = await localStorage.removeData(getDataDto);

      // assert
      verify(sharedPreferencesMock.remove(getDataDto.key));
      expect(res, true);
    });
  });
}
