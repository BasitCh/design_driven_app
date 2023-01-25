import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/typography/text_styles.dart';
import 'package:flutter/material.dart';

const double _smallTextScaleFactor = 0.80;

class BlackBullTheme {
  static ThemeData get standard {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(accentColor: BlackBullColors.white),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: BlackBullColors.whiteBackground,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
      scrollbarTheme: _scrollbarTheme,
    );
  }

  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: BlackBullTextStyle.headline1,
      headline2: BlackBullTextStyle.headline2,
      headline3: BlackBullTextStyle.headline3,
      headline4: BlackBullTextStyle.headline4,
      headline5: BlackBullTextStyle.headline5,
      headline6: BlackBullTextStyle.headline6,
      subtitle1: BlackBullTextStyle.subtitle1,
      subtitle2: BlackBullTextStyle.subtitle2,
      bodyText1: BlackBullTextStyle.bodyText1,
      bodyText2: BlackBullTextStyle.bodyText2,
      caption: BlackBullTextStyle.caption,
      overline: BlackBullTextStyle.overline,
      button: BlackBullTextStyle.button,
    );
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: BlackBullTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: BlackBullTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: BlackBullTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: BlackBullTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: BlackBullTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: BlackBullTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: BlackBullTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: BlackBullTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: BlackBullTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: BlackBullTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: BlackBullTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: BlackBullTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: BlackBullTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(color: BlackBullColors.white);
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: BlackBullColors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(208, 54),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: BlackBullColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: BlackBullColors.white, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: BlackBullColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: BlackBullColors.white),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: BlackBullColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2.0,
          color: BlackBullColors.white,
        ),
      ),
      labelColor: BlackBullColors.white,
      unselectedLabelColor: BlackBullColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1,
      color: BlackBullColors.black25,
    );
  }

  static ScrollbarThemeData get _scrollbarTheme {
    return const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(BlackBullColors.textBlue),
    );
  }
}
