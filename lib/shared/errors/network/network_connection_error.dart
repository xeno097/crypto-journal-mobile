import 'package:crypto_journal_mobile/shared/errors/base_error.dart';

const NETWORK_CONNECTION_ERROR = "Network connection error";

class NetworkConnectionError extends BaseError {
  NetworkConnectionError()
      : super(
          message: NETWORK_CONNECTION_ERROR,
        );
}
