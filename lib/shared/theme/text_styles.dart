import 'package:crypto_journal_mobile/shared/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final defaultTextStyle = GoogleFonts.montserrat(
  color: Colors.white,
  fontSize: 15.0,
);

final defaultTextStyleStonks = defaultTextStyle.copyWith(
  color: textColorStonks,
);

final defaultTextStyleNotStonks = defaultTextStyle.copyWith(
  color: textColorNotStonks,
);

final secondaryTextStyle = defaultTextStyle.copyWith(
  fontSize: 12.0,
);

final subTitleTextStyle = defaultTextStyle.copyWith(
  fontSize: 18.0,
);

final pageTitleTextStyle = defaultTextStyle.copyWith(
  fontSize: 21.0,
);

final mainTitleTextStyle = defaultTextStyle.copyWith(
  fontSize: 30.0,
);
