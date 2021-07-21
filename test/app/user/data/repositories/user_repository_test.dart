import 'package:crypto_journal_mobile/app/user/data/data_sources/user_remote_data_source.dart';
import 'package:crypto_journal_mobile/app/user/data/repositories/user_repository.dart';
import 'package:crypto_journal_mobile/shared/data/network_info/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks([IUserRemoteDataSource, INetworkInfo])
void main() {
  late MockIUserRemoteDataSource userRemoteDataSourceMock;
  late MockINetworkInfo networkInfoMock;
  late UserRepository userRepository;

  setUp(() {
    userRemoteDataSourceMock = MockIUserRemoteDataSource();
    networkInfoMock = MockINetworkInfo();
    userRepository = UserRepository(
      userRemoteDataSource: userRemoteDataSourceMock,
      networkInfo: networkInfoMock,
    );
  });
}
