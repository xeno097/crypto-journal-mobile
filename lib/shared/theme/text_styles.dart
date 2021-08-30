import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final defaultTextStyle = GoogleFonts.montserrat(
  color: Colors.white,
  fontSize: 15.0,
);

final defaultTextStyleSecondary = defaultTextStyle.copyWith(
  color: textColorSecondary,
);

final defaultTextStyleStonks = defaultTextStyle.copyWith(
  color: textColorStonks,
);

final defaultTextStyleNotStonks = defaultTextStyle.copyWith(
  color: textColorNotStonks,
);

final defaultSecondaryTextStyle = defaultTextStyle.copyWith(
  fontSize: 12.0,
);

final secondaryTextStyle = defaultTextStyle.copyWith(
  fontSize: 12.0,
  color: textColorSecondary,
);

final subTitleTextStyle = defaultTextStyle.copyWith(
  fontSize: 18.0,
);

final pageTitleTextStyle = defaultTextStyle.copyWith(
  fontSize: 21.0,
);

final boldPageTitleTextStyle = defaultTextStyle.copyWith(
  fontSize: 21.0,
  fontWeight: FontWeight.bold,
);

final mainTitleTextStyle = defaultTextStyle.copyWith(
  fontSize: 30.0,
);

final boldMainTitleTextStyle = mainTitleTextStyle.copyWith(
  fontWeight: FontWeight.bold,
);
