import 'package:crypto_journal_mobile/app/operation/service/dtos/operation_dto.dart';

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
}
