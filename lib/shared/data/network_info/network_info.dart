import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

final networkInfoProvider = Provider((ProviderReference ref) =>
    NetworkInfo(connectionChecker: InternetConnectionChecker()));

class NetworkInfo implements INetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfo({
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
