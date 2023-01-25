import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:flutter/material.dart';

class StandardText extends StatelessWidget {
  const StandardText({
    required this.text,
    Key? key,
    this.textAlign = TextAlign.center,
    this.fontSize = 14,
    this.color,
    this.fontWeight = FontWeight.w300,
    this.fontStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.style,
    this.maxLines,
    this.overflow,
    this.height,
  }) : super(key: key);

  factory StandardText.withTheme(
    String text,
    TextStyle theme,
    Color color, {
    TextAlign align = TextAlign.center,
  }) {
    return StandardText(
      text: text,
      style: theme.copyWith(
        color: color,
      ),
      textAlign: align,
    );
  }

  factory StandardText.caption(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration? decoration,
  }) {
    final TextStyle style = BlackBullTextStyle.caption.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  // Body
  factory StandardText.body2(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double fontSize = 15,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration decoration = TextDecoration.none,
  }) {
    final TextStyle style = BlackBullTextStyle.bodyText2.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.body1(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration decoration = TextDecoration.none,
  }) {
    final TextStyle style = BlackBullTextStyle.bodyText1.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  // Subtitles
  factory StandardText.subtitle2(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final TextStyle style = BlackBullTextStyle.subtitle2.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.subtitle1(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final TextStyle style = BlackBullTextStyle.subtitle1.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // Headers
  factory StandardText.headline6(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    final TextStyle style = BlackBullTextStyle.headline6.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.headline5(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    final TextStyle style = BlackBullTextStyle.headline5.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.headline4(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) {
    final TextStyle style = BlackBullTextStyle.headline4.copyWith(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.headline3(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration? decoration,
  }) {
    final TextStyle style = BlackBullTextStyle.headline3.copyWith(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.headline2(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final TextStyle style = BlackBullTextStyle.headline2.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.headline1(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final TextStyle style = BlackBullTextStyle.headline1.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.textColor,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.underline(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    TextOverflow overflow = TextOverflow.ellipsis,
    double? fontSize,
    int? maxLines,
  }) {
    final TextStyle style = BlackBullTextStyle.caption.copyWith(
      fontWeight: fontWeight,
      color: color ?? BlackBullColors.black,
      fontSize: fontSize,
      decoration: TextDecoration.underline,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.linkUnderline(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final TextStyle style = BlackBullTextStyle.bodyText1.copyWith(
      color: color ?? BlackBullColors.accent,
      fontWeight: fontWeight,
      decoration: TextDecoration.underline,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  // Buttons
  factory StandardText.button(
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    double? letterSpacing,
    TextOverflow? overflow,
  }) {
    final TextStyle style = BlackBullTextStyle.button.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      letterSpacing: letterSpacing,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
    );
  }

  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final TextDecoration textDecoration;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? defaultTextStyle.overflow,
      maxLines: maxLines ?? defaultTextStyle.maxLines,
      style: style ??
          TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: textDecoration,
            fontFamily: 'Mont',
            height: height,
          ),
    );
  }
}
