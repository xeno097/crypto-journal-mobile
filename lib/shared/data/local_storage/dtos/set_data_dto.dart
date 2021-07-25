import 'package:equatable/equatable.dart';

class SetDataDto extends Equatable {
  final String key;
  final String value;

  SetDataDto({
    required this.key,
    required this.value,
  });

  @override
  List<Object?> get props => [
        this.key,
        this.value,
      ];
}
