import 'package:crypto_journal_mobile/app/user/data/data_sources/auth_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/repositories/auth_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([
  INetworkInfo,
  IAuthRemoteDataSource,
])
void main() {
  late final AuthRepository authRepository;
  late final MockINetworkInfo networkInfoMock;
  late final MockIAuthRemoteDataSource authRemoteDataSourceMock;

  setUp(() {
    networkInfoMock = MockINetworkInfo();
    authRemoteDataSourceMock = MockIAuthRemoteDataSource();
    authRepository = AuthRepository(
      authRemoteDataSource: authRemoteDataSourceMock,
      networkInfo: networkInfoMock,
    );
  });
}
