import 'package:crypto_journal_mobile/app/crypto_currency/service/dtos/crypto_currency_dto.dart';
import 'package:crypto_journal_mobile/shared/theme/constants.dart';
import 'package:crypto_journal_mobile/shared/theme/text_styles.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_layout_container.dart';
import 'package:crypto_journal_mobile/shared/widgets/containers/base_tile_widget.dart';
import 'package:crypto_journal_mobile/shared/widgets/images/network_icon_image.dart';
import "package:flutter/material.dart";

class SelectCyptoCurrencyListTile extends StatelessWidget {
  final CryptoCurrencyDto cryptoCurrencyDto;

  const SelectCyptoCurrencyListTile({
    Key? key,
    required this.cryptoCurrencyDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayoutContainer(
      builder: (context, size) {
        final height = size.height;
        final padding = height * (defaultContainerPadding / defaultHeight);
        final iconSize = height - 2 * padding;

        return BaseTileWidget(
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              NetworkIconImage(
                url: this.cryptoCurrencyDto.icon,
                placeholder: Icons.monetization_on_outlined,
                size: iconSize,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultRowItemPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cryptoCurrencyDto.symbol,
                      style: subTitleTextStyle.copyWith(
                        fontSize:
                            height * (primaryTextStyleSize / defaultHeight),
                      ),
                    ),
                    Text(
                      cryptoCurrencyDto.name,
                      overflow: TextOverflow.ellipsis,
                      style: defaultTextStyle.copyWith(
                        fontSize:
                            height * (secondaryTextStyleSize / defaultHeight),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
