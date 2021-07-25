import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfo networkInfoImpl;
  late MockInternetConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfo(connectionChecker: mockDataConnectionChecker);
  });

  group('NetworkInfo.isConnected', () {
    test(
        'should call the hasConnection method of the InternetConnectionChecker class',
        () async {
      // arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      // act
      final res = networkInfoImpl.isConnected;

      // assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(res, tHasConnectionFuture);
    });
  });
}
