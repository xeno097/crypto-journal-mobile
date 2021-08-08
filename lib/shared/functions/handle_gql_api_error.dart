import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';

void handleGqlApiError(dynamic data) {
  if (data is List) {
    _handleListGqlApiError(data);
    return;
  }

  final String dataType = data["__typename"];

  if (dataType == "ApiError") {
    final String errorCode = data["code"];
    throw ApiException.fromApiErrorCode(errorCode);
  }
}

void _handleListGqlApiError(List data) {
  if (data.length == 0) {
    return;
  }

  handleGqlApiError(data[0]);
}
