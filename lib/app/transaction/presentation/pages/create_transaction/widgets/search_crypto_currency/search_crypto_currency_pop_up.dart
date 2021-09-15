import 'package:crypto_journal_mobile/app/crypto_currency/presentation/providers/search_crypto_currency_provider.dart';
import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/app/transaction/presentation/pages/create_transaction/widgets/search_crypto_currency/search_crypto_currency_list_tile.dart';
import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/container_decoration.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/default_list_element_padding.dart';
import 'package:crypto_journal_mobile/shared/widgets/inputs/default_text_input.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import 'package:crypto_journal_mobile/shared/widgets/placeholder/error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCryptoCurrencyPopUp extends StatefulWidget {
  final String hintText;
  final void Function(String value)? onChanged;

  const SearchCryptoCurrencyPopUp({
    Key? key,
    this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchCryptoCurrencyPopUpState createState() =>
      _SearchCryptoCurrencyPopUpState();
}

class _SearchCryptoCurrencyPopUpState extends State<SearchCryptoCurrencyPopUp> {
  CryptoCurrencyDto? _selectedCryptoCurrency;
  String _hintText = "";
  Function(String value)? _onChanged;

  @override
  void initState() {
    super.initState();
    this._hintText = this.widget.hintText;
    this._onChanged = this.widget.onChanged;
  }

  void _setSelectedCryptoCurrency(
    CryptoCurrencyDto cryptoCurrencyDto,
  ) {
    setState(() {
      this._selectedCryptoCurrency = cryptoCurrencyDto;

      if (this._onChanged != null) {
        this._onChanged!(cryptoCurrencyDto.symbol);
      }

      Navigator.pop(context);
    });
  }

  List<Widget> _selectableListBuilder(List<CryptoCurrencyDto> items) {
    final ret = items.map(
      (cryptoCurrency) => DefaultListElementPadding(
        child: GestureDetector(
          onTap: () => this._setSelectedCryptoCurrency(
            cryptoCurrency,
          ),
          child: SelectCyptoCurrencyListTile(
            cryptoCurrencyDto: cryptoCurrency,
          ),
        ),
      ),
    );

    return ret.toList();
  }

  Widget _searcheablePopUpBuilder(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: defaultContainerDecoration.copyWith(
          boxShadow: [],
          color: backGroundColorPrimary,
        ),
        margin: EdgeInsets.all(defaultPagePadding),
        padding: EdgeInsets.all(defaultListElementPadding),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: defaultListElementPadding,
              ),
              child: DefaultTextBoxInput(
                hintText: this.widget.hintText,
                onChanged: (String value) {
                  context.read(searchStringStateProvider).state = value;
                },
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, watch, child) {
                  final request = watch(searchCryptoCurrencyProvider);

                  return request.when(
                    data: (cryptoCurrencies) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultContainerPadding,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: _selectableListBuilder(
                              cryptoCurrencies,
                            ),
                          ),
                        ),
                      );
                    },
                    loading: () => DefaultCircularProgressIndicator(),
                    error: (err, _) => ErrorPlaceholder(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonTextBuilder(double height) {
    if (this._selectedCryptoCurrency == null) {
      return Text(
        this._hintText,
        style: secondaryTextStyle.copyWith(
          fontSize: height * primaryTextStyleSize / defaultHeight,
        ),
      );
    }

    return Text(
      this._selectedCryptoCurrency!.symbol.toUpperCase(),
      style: defaultTextStyle.copyWith(
        fontSize: height * primaryTextStyleSize / defaultHeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, size) {
        final height = size.height;

        return GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: this._searcheablePopUpBuilder,
          ),
          child: DefaultContainer(
            child: Center(
              child: this._buttonTextBuilder(
                height,
              ),
            ),
          ),
        );
      },
    );
  }
}
