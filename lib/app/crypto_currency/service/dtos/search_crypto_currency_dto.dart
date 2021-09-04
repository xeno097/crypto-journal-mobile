import 'package:equatable/equatable.dart';

class SearchCryptoCurrencyDto extends Equatable {
  final String text;

  SearchCryptoCurrencyDto({
    required this.text,
  });

  @override
  List<Object?> get props => [this.text];
}
