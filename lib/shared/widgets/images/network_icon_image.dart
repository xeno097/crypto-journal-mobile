import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_journal_mobile/shared/widgets/loading/default_circular_progress_indicator.dart';
import "package:flutter/material.dart";

class NetworkIconImage extends StatelessWidget {
  final String? url;
  final double? size;
  final IconData placeholder;

  const NetworkIconImage({
    Key? key,
    this.url,
    this.size,
    required this.placeholder,
  }) : super(key: key);

  Widget _defaultIconBuilder() {
    return Icon(
      this.placeholder,
      size: this.size,
      color: Colors.white,
    );
  }

  Widget _networkIconImageBuilder() {
    if (this.url != null) {
      return CachedNetworkImage(
        imageUrl: this.url!,
        height: this.size,
        width: this.size,
        placeholder: (context, url) => DefaultCircularProgressIndicator(),
        errorWidget: (context, url, err) => this._defaultIconBuilder(),
      );
    }

    return this._defaultIconBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return this._networkIconImageBuilder();
  }
}
