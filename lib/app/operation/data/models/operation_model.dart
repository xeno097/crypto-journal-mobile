import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';

OperationType _operationTypeFromString(String type) {
  switch (type) {
    case "SELL":
      return OperationType.SELL;
    default:
      return OperationType.BUY;
  }
}

class OperationModel extends OperationDto {
  OperationModel({
    required String id,
    required String name,
    required String slug,
    required OperationType type,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          type: type,
        );

  factory OperationModel.fromJson(Map<String, dynamic> jsonMap) {
    return OperationModel(
      id: jsonMap["id"],
      name: jsonMap["name"],
      slug: jsonMap["slug"],
      type: _operationTypeFromString(jsonMap["type"]),
    );
  }
}
