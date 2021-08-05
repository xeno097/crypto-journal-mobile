import 'package:equatable/equatable.dart';

class GetDataDto extends Equatable {
  final String key;

  GetDataDto({
    required this.key,
  });

  @override
  List<Object?> get props => [
        this.key,
      ];
}
