import 'package:crypto_journal_mobile/shared/widgets/buttons/default_drop_down_button.dart';
import 'package:equatable/equatable.dart';

enum OperationType {
  BUY,
  SELL,
}

class OperationDto extends Equatable implements DropDownListItem {
  final String id;
  final String name;
  final String slug;
  final OperationType type;

  OperationDto({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.slug,
        this.type,
      ];
}
