import 'package:flutter/material.dart';

import '../constant/const_value.dart';
import 'theme_colors.dart';

class AppTheme {
  late Brightness brightness;

  Color get primaryColor => ThemeColors.primaryColorDark;

  Color get accentColor => ThemeColors.accentColor;

  Color get darkAccentColor => ThemeColors.scaffoldBackgroundColor;

  Color get darkPrimaryColor => ThemeColors.primaryColorDark;

  Color get indicatorColor => Color(0xff0E1D36);

  Color get buttonColor => Color(0xff3B3B3B);

  Color get hintColor => Color(0xff280C0B);

  Color get highlightColor => Color(0xff372901);

  Color get hoverColor => Color(0xff3A3A3B);

  Color get focusColor => Color(0xff0B2512);

  Color get disabledColor => Colors.grey;

  Color get textSelectionColor => Colors.black;

  Color get cardColor => Color(0xFF151515);

  Color get whiteColor => Colors.white;
  static Map<int, Color> color = {
    50: Color.fromRGBO(60, 40, 8, .1),
    100: Color.fromRGBO(60, 40, 8, .2),
    200: Color.fromRGBO(60, 40, 8, .3),
    300: Color.fromRGBO(60, 40, 8, .4),
    400: Color.fromRGBO(60, 40, 8, .5),
    500: Color.fromRGBO(60, 40, 8, .6),
    600: Color.fromRGBO(60, 40, 8, .7),
    700: Color.fromRGBO(60, 40, 8, .8),
    800: Color.fromRGBO(60, 40, 8, .9),
    900: Color.fromRGBO(60, 40, 8, 1),
  };
  MaterialColor primaryMaterialColor = MaterialColor(0xFF113145, color);
  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      primaryColorDark: ThemeColors.primaryColorDark,
      primaryColorLight: ThemeColors.primaryColorLight,
      highlightColor: ThemeColors.primaryColorLight,
      backgroundColor: ThemeColors.backgroundColor,
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch: primaryMaterialColor, accentColor: primaryColor)
          .copyWith(secondary: accentColor)
          .copyWith(secondary: primaryColor),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      primaryColorDark: ThemeColors.primaryColorDark,
      primaryColorLight: ThemeColors.primaryColorLight,
      highlightColor: ThemeColors.primaryColorLight,
      backgroundColor: ThemeColors.backgroundColor, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor).copyWith(secondary: primaryColor),
    );
  }

  ThemeData get theme {
    return !isLightMode ? darkTheme : lightTheme;
  }
}
