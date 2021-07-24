import 'package:crypto_journal_mobile/shared/errors/api_error/api_exception.dart';

void handleGqlApiError(Map<String, dynamic> data) {
  final String dataType = data["__typename"];

  if (dataType == "ApiError") {
    final String errorCode = data["code"];
    throw ApiException.fromApiErrorCode(errorCode);
  }
}
