import 'package:flutter/material.dart';

import 'color_constant.dart';

// This class will have all the color constant which we are using in this App.
class AppFontStyle {
  static String fontFamily = 'Rubik';
  static TextStyle textNormal({Color color = AppColors.black, bool isUnderline = false}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 14.0,
        decoration:isUnderline?TextDecoration.underline:null,
        fontWeight: FontWeight.w400);
  }

  static TextStyle textXNormal({Color color = AppColors.black}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.w400);
  }

  static TextStyle textXNormalBold({Color color = AppColors.black}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.w500);
  }

  static TextStyle textXXNormalBold({Color color = AppColors.black}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 18.0,
        fontWeight: FontWeight.w500);
  }

  static TextStyle textXXXNormalBold({Color color = AppColors.black}) {
    return TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 20.0,
        fontWeight: FontWeight.w500);
  }
}
