import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/font_weights.dart';
import 'package:flutter/widgets.dart';

/// Zimpel Text Style Definitions
class BlackBullTextStyle {
  static const TextStyle _baseTextStyle = TextStyle(
    fontFamily: 'Mont',
    color: BlackBullColors.black,
  );

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 56,
      fontWeight: BlackBullFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontWeight: BlackBullFontWeight.regular,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: BlackBullFontWeight.extraBold,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: BlackBullFontWeight.black,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 15,
      fontWeight: BlackBullFontWeight.extraBold,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: BlackBullFontWeight.extraBold,
    );
  }

  /// Subtitle 1 Text Style
  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: BlackBullFontWeight.bold,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: BlackBullFontWeight.bold,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 17,
      fontWeight: BlackBullFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 15,
      fontWeight: BlackBullFontWeight.regular,
    );
  }

  /// Caption Text Style
  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: BlackBullFontWeight.regular,
    );
  }

  /// Overline Text Style
  static TextStyle get overline {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: BlackBullFontWeight.regular,
    );
  }

  // hint text style
  static TextStyle get hintStyle {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      color: const Color(0xFF666666),
      fontWeight: BlackBullFontWeight.regular,
    );
  }
  // customStyle text style
  static TextStyle get customStyle {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      color: const Color(0xFF666666),
      fontWeight: BlackBullFontWeight.regular,
    );
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: BlackBullFontWeight.medium,
      letterSpacing: 1,
      color: BlackBullColors.white,
    );
  }

}
